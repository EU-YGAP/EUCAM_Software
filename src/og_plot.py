"""
Copyright 2019,2020 European Union

Licensed under the EUPL, Version 1.2 or – as soon they will be approved by the European Commission –
subsequent versions of the EUPL (the "Licence");
You may not use this work except in compliance with the Licence.
You may obtain a copy of the Licence at:
http://ec.europa.eu/idabc/eupl

Unless required by applicable law or agreed to in writing, software distributed under the Licence is distributed on
an "AS IS" basis, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the Licence for the specific language governing permissions and limitations under the Licence.

Author: François Blondeau (European Commisssion, Directorate-General for Economic and Financial Affairs)

"""
def og_plot(title, fig, subnum, data, styles, colors, liney0, indlegend, chartnbrow=6, ChartType='plot', second_axis_index=-1, align=True):
    import numpy as np
    from itertools import cycle
    import matplotlib.ticker as ticker
    # from matplotlib.ticker import AutoMinorLocator, MultipleLocator
    from matplotlib.ticker import FormatStrFormatter

    # data = np.round(data, 2)  #  (round = 2, 2 decimal has no effect) new code rem
    nbcol = 2
    # styles = ['-', '-', '-.', ':', '--']
    stylecycler = cycle(styles)
    # colors = ['k', 'b', 'g', 'r', 'y']
    colorcycler = cycle(colors)
    ax = fig.add_subplot(chartnbrow, nbcol, subnum)
    ax.yaxis.set_major_locator(ticker.LinearLocator(5))  # new code (4 ticks)
    ax.tick_params(which='major', width=1.0, labelsize=6)  # new code (labelsixe = 6)
    ax.yaxis.set_major_formatter(FormatStrFormatter('%.2f'))  # new code (2 decimal places for y labels)
    ax.xaxis.set_major_formatter(FormatStrFormatter('%.0f'))  # new code (0 decimal places for x labels)
    ax.set_title(title, fontsize=8)
    ax.grid(True)
    lns = []

    if ChartType == 'plot':
        ind = np.arange(len(data.index))
        space = int(np.ceil(len(data.index) / 8))
        # new code: lines below to have the same xticklabel
        indshort = list(range(len(data.index)-1, 0, -space))
        indshort = np.flip(indshort)
        xtick = list(map(str, list(data.index)))
        xtickshort = xtick[0:len(indshort)]
        for i in range(0, len(indshort)):
            xtickshort[i] = xtick[indshort[i]]

        if len(data) >= second_axis_index > 0:
            ax2 = ax.twinx()
# TODO :         for column in data.columns:
        for column in data:
            color = next(colorcycler)
            linestyle = next(stylecycler)
            # new code: rem lines below
            # if plot_index >= second_axis_index > 0:
            #     lns+=ax2.plot(data[column], color=color, linestyle=linestyle, label=column, linewidth=1)
            # else:
            #    lns+=ax.plot(data[column], color=color, linestyle=linestyle, label=column, linewidth=1)
            lns += ax.plot(ind, data[column], color=color, linestyle=linestyle, label=column, linewidth=1)
# TODO :
        labels = [l.get_label() for l in lns]
        if indlegend == 1:
            ax.legend(lns, labels, loc='upper center', bbox_to_anchor=(0.5, -0.2), shadow=True, fontsize='xx-small', ncol=2)
        ax.set_autoscale_on(True)
        # ax.relim()   new code rem line
        ax.autoscale_view(True, True, True)
        # new code: lines below to have the same xlabels
        ax.set_xticks(indshort)
        ax.set_xticklabels(xtickshort)
        ax.set_xlim(0, len(data.index))

        # if title[0:17] != 'Unemployment rate' and title[0:7] != 'TFP (' and title[0:4] != 'TFP,' and title[0:4] != 'Part' and title[0:3] != 'GDP' and title[0:7] != 'Average' and title[0:3] != 'Pop' and title[0:10] != 'Investment':
        if liney0 == 1:
            ax.axhline(y=0, color="black", linestyle="--", linewidth=0.5)  # new code add line y=0

        # new code: rem lines below
        # if len(data) >= second_axis_index > 0 and align:
        #    align_yaxis(ax, ax2)

    if ChartType == 'bar':
        ind = np.arange(len(data.index))
        space = int(np.ceil(len(data.index)/8))
        indshort = list(range(len(data.index)-1, 0, -space))
        indshort = np.flip(indshort)
        xtick = list(map(str, list(data.index)))
        xtickshort = xtick[0:len(indshort)]
        for i in range(0, len(indshort)):
            xtickshort[i] = xtick[indshort[i]]
        datanb = len(data.columns)
        width = 0.6 / datanb
        nb = 0

        for column in data:
            color = next(colorcycler)
            lns += ax.bar(ind + nb * width, data[column], color=color, width=width, align='center')
            nb+=1

        labels = list(data.columns)
        if indlegend == 1:
            ax.legend(labels, loc='upper center', bbox_to_anchor=(0.5, -0.2), shadow=True, fontsize='xx-small', ncol=datanb)

        # new code: lines below to have the same xlabels
        ax.set_xticks(indshort)
        ax.set_xticklabels(xtickshort)
        ax.axhline(y=0, color="black", linestyle="--", linewidth=0.5)  # new code add line y=0
        ax.set_xlim(0, len(data.index))

    subnum += 1
    return fig, subnum

def align_yaxis(ax1, ax2):
    """Align zeros of the two axes, zooming them out by same ratio"""
    axes = (ax1, ax2)
    extrema = [ax.get_ylim() for ax in axes]
    tops = [extr[1] / (extr[1] - extr[0]) for extr in extrema]
    # Ensure that plots (intervals) are ordered bottom to top:
    if tops[0] > tops[1]:
        axes, extrema, tops = [list(reversed(l)) for l in (axes, extrema, tops)]

    # How much would the plot overflow if we kept current zoom levels?
    tot_span = tops[1] + 1 - tops[0]

    b_new_t = extrema[0][0] + tot_span * (extrema[0][1] - extrema[0][0])
    t_new_b = extrema[1][1] - tot_span * (extrema[1][1] - extrema[1][0])
    axes[0].set_ylim(extrema[0][0], b_new_t)
    axes[1].set_ylim(t_new_b, extrema[1][1])

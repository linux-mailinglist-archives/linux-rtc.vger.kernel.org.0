Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 073C891D81
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Aug 2019 09:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbfHSHCz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 19 Aug 2019 03:02:55 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49348 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfHSHCz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 19 Aug 2019 03:02:55 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id 399D6286276
Subject: Re: [PATCH 0/4] Followup to "Make clk_hw::init NULL after clk
 registration"
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-rtc@vger.kernel.org, bot@kernelci.org,
        tomeu.vizoso@collabora.com, mgalka@collabora.com,
        broonie@kernel.org, matthew.hart@linaro.org, khilman@baylibre.com,
        enric.balletbo@collabora.com,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, Jun Nie <jun.nie@linaro.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sugaya Taichi <sugaya.taichi@socionext.com>,
        Taniya Das <tdas@codeaurora.org>
References: <20190815160020.183334-1-sboyd@kernel.org>
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <b0776e4d-aab2-72fe-f12a-e782ea0c4712@collabora.com>
Date:   Mon, 19 Aug 2019 08:02:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190815160020.183334-1-sboyd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 15/08/2019 17:00, Stephen Boyd wrote:
> I found some more cases where the init structure is referenced from
> within the clk_hw struct after clk_registration is called. I suspect the
> rtc driver fix is useful to avoid crashes on Allwinner devices, reported
> by kernel-ci.

Please feel free to add this trailer where appropriate:

  Reported-by: "kernelci.org bot" <bot@kernelci.org>


Thanks,
Guillaume

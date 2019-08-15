Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAE9A8EFE6
	for <lists+linux-rtc@lfdr.de>; Thu, 15 Aug 2019 18:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729585AbfHOQAX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 15 Aug 2019 12:00:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:46502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729539AbfHOQAX (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 15 Aug 2019 12:00:23 -0400
Received: from mail.kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 74E6A206C1;
        Thu, 15 Aug 2019 16:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565884822;
        bh=pln53YyoxIrrm78qGdr+loO6ia2BSdIYlVyYfDz+Ck8=;
        h=From:To:Cc:Subject:Date:From;
        b=Txfhv8QBYpK2livl6OXHUknugGqueIyUg/oPjQY0GQ9j/n+qYFhX6mcfNvBqdAJdu
         AzIKZaGLoIj8jaAg+h2Eld8FGlTFia13cJwukraa1G+bcbS7q3Nqug+7o8mJNuUSpe
         qFehkLroFRc6XDy/sw27axiMadXjVsw6HRPXs9fA=
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-rtc@vger.kernel.org, bot@kernelci.org,
        tomeu.vizoso@collabora.com, guillaume.tucker@collabora.com,
        mgalka@collabora.com, broonie@kernel.org, matthew.hart@linaro.org,
        khilman@baylibre.com, enric.balletbo@collabora.com,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, Jun Nie <jun.nie@linaro.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sugaya Taichi <sugaya.taichi@socionext.com>,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH 0/4] Followup to "Make clk_hw::init NULL after clk registration"
Date:   Thu, 15 Aug 2019 09:00:16 -0700
Message-Id: <20190815160020.183334-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

I found some more cases where the init structure is referenced from
within the clk_hw struct after clk_registration is called. I suspect the
rtc driver fix is useful to avoid crashes on Allwinner devices, reported
by kernel-ci.

Cc: <bot@kernelci.org>                                                                                                                                      
Cc: <tomeu.vizoso@collabora.com>
Cc: <guillaume.tucker@collabora.com>
Cc: <mgalka@collabora.com>
Cc: <broonie@kernel.org>
Cc: <matthew.hart@linaro.org>
Cc: <khilman@baylibre.com>
Cc: <enric.balletbo@collabora.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>      
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jun Nie <jun.nie@linaro.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sugaya Taichi <sugaya.taichi@socionext.com>
Cc: Taniya Das <tdas@codeaurora.org>

Stephen Boyd (4):
  clk: milbeaut:  Don't reference clk_init_data after registration
  clk: zx296718: Don't reference clk_init_data after registration
  rtc: sun6i: Don't reference clk_init_data after registration
  clk: qcom: Remove error prints from DFS registration

 drivers/clk/clk-milbeaut.c     |   2 +-
 drivers/clk/qcom/clk-rcg2.c    |   8 +--
 drivers/clk/zte/clk-zx296718.c | 109 +++++++++++++++------------------
 drivers/rtc/rtc-sun6i.c        |   2 +-
 4 files changed, 52 insertions(+), 69 deletions(-)

-- 
Sent by a computer through tubes


Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D863536F20C
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Apr 2021 23:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237209AbhD2Vas (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 29 Apr 2021 17:30:48 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:51463 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233284AbhD2Vap (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 29 Apr 2021 17:30:45 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 4DFC91C0003;
        Thu, 29 Apr 2021 21:29:56 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: Re: (subset) [PATCH 0/9] mfd/rtc/regulator: Drop board file support for Samsung PMIC
Date:   Thu, 29 Apr 2021 23:29:50 +0200
Message-Id: <161973168395.2582973.3771358876796788667.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210420170118.12788-1-krzysztof.kozlowski@canonical.com>
References: <20210420170118.12788-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 20 Apr 2021 19:01:09 +0200, Krzysztof Kozlowski wrote:
> The Samsung PMIC drivers since long time are used only on devicetree
> platforms (Samsung Exynos) and there are no users with board files.
> 
> Drop the support for board files entirely and depend on OF for matching.
> 
> This makes the code smaller and simpler.
> 
> [...]

Applied, thanks!

[7/9] rtc: s5m: Remove reference to parent's device pdata
      commit: aa364b12fd7404374a8a6c55ec2e4a70aba9a574

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

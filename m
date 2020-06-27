Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B64C620C0F5
	for <lists+linux-rtc@lfdr.de>; Sat, 27 Jun 2020 13:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgF0LIX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 27 Jun 2020 07:08:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:49286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726335AbgF0LIW (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 27 Jun 2020 07:08:22 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 489A1214D8;
        Sat, 27 Jun 2020 11:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593256102;
        bh=TjTMGf71hRc8OW24VbETXWEqOz6ytX6pTBkxNEYJXSQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tMod9uFRT5S5G394Uk/gQtwKaJBrMvgPD8/h2wUf6diETm8vcdWgw14jYTyk18SAG
         oghpm2a1hJ1Di9KQdah2OKLR11J7iY1i8nTHzUOLBdQ0YOCYthv2QZQEkAaPZpl1zZ
         OpMrO9IwOBmiB1EgQycRtL1MrU07V3PXAOxC2VeM=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=wait-a-minute.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jp8h2-006s0z-MO; Sat, 27 Jun 2020 12:08:20 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Jason Cooper <jason@lakedaemon.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thomas Gleixner <tglx@linutronix.de>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        nicolas.ferre@microchip.com, robh+dt@kernel.org,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com
Cc:     Andrew Perepech <andrew.perepech@mediatek.com>,
        linux-mediatek@lists.infradead.org,
        Stephane Le Provost <stephane.leprovost@mediatek.com>,
        linux-arm-kernel@lists.infradead.org,
        Pedro Tsai <pedro.tsai@mediatek.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 0/3] add RTT support for SAM9X60
Date:   Sat, 27 Jun 2020 12:08:02 +0100
Message-Id: <159325548742.93134.14743817102464415551.b4-ty@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <1591779936-18577-1-git-send-email-claudiu.beznea@microchip.com>
References: <1591779936-18577-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: jason@lakedaemon.net, matthias.bgg@gmail.com, brgl@bgdev.pl, tglx@linutronix.de, claudiu.beznea@microchip.com, nicolas.ferre@microchip.com, robh+dt@kernel.org, a.zummo@towertech.it, alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com, andrew.perepech@mediatek.com, linux-mediatek@lists.infradead.org, stephane.leprovost@mediatek.com, linux-arm-kernel@lists.infradead.org, pedro.tsai@mediatek.com, bgolaszewski@baylibre.com, fparent@baylibre.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 10 Jun 2020 12:05:33 +0300, Claudiu Beznea wrote:
> This series adds RTT support for SAM9X60.
> 
> Changes in v2:
> - use "atmel,at91sam9260-rtt" as fallback for compatible
> - in patch 1 keep only the addition of sam9x60_aic_irq_fixup
> - get rid of patches 2/5 from v1
> - squash patches 4/5, 5/5 from v1
> - change commit title for patch "rtc: at91sam9: add microchip,sam9x60-rtt"
>   from v1 into "dt-bindings: rtc: add microchip,sam9x60-rtt" and
>   place it before device tree patch
> 
> [...]

Applied to irq/irqchip-5.9:

[1/3] irqchip/atmel-aic5: Add support for sam9x60 rtt fixup
      commit: 293953d60e214aa44b3261f5350b83f285a95eb4

Thanks,

	M.
-- 
Without deviation from the norm, progress is not possible.


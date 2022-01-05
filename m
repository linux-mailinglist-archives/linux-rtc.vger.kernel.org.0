Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6000A484B78
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Jan 2022 01:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236694AbiAEAGB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 4 Jan 2022 19:06:01 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:43395 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236637AbiAEAFr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 4 Jan 2022 19:05:47 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D19F7C0008;
        Wed,  5 Jan 2022 00:05:44 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        linux-rtc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: ftrtc010: Use platform_get_irq() to get the interrupt
Date:   Wed,  5 Jan 2022 01:05:36 +0100
Message-Id: <164134112610.1688528.10619491377155917684.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211220011524.17206-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211220011524.17206-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 20 Dec 2021 01:15:24 +0000, Lad Prabhakar wrote:
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.
> 
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq().
> 
> [...]

Applied, thanks!

[1/1] rtc: ftrtc010: Use platform_get_irq() to get the interrupt
      commit: 05020a733b02cf7a474305e620fb306cd3abfe84

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

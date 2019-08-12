Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 318178A8ED
	for <lists+linux-rtc@lfdr.de>; Mon, 12 Aug 2019 23:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbfHLVEo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 12 Aug 2019 17:04:44 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:41605 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbfHLVEo (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 12 Aug 2019 17:04:44 -0400
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id DE26C240003;
        Mon, 12 Aug 2019 21:04:42 +0000 (UTC)
Date:   Mon, 12 Aug 2019 23:04:42 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: mxc: use spin_lock_irqsave instead of spin_lock_irq
 in IRQ context
Message-ID: <20190812210442.GV3600@piout.net>
References: <20190807082310.10135-1-huangfq.daxian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807082310.10135-1-huangfq.daxian@gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 07/08/2019 16:23:10+0800, Fuqian Huang wrote:
> As spin_unlock_irq will enable interrupts.
> mxc_rtc_irq_enable is called from interrupt handler mxc_rtc_interrupt.
> Interrupts are enabled in interrupt handler.
> Use spin_lock_irqsave/spin_unlock_irqrestore instead of spin_(un)lock_irq
> in IRQ context to avoid this.
> 
> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
> ---
>  drivers/rtc/rtc-mxc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF485362BA6
	for <lists+linux-rtc@lfdr.de>; Sat, 17 Apr 2021 00:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbhDPW4v (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 16 Apr 2021 18:56:51 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:43317 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230258AbhDPW4u (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 16 Apr 2021 18:56:50 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 91050FF802;
        Fri, 16 Apr 2021 22:56:24 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     a.zummo@towertech.it, Tian Tao <tiantao6@hisilicon.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: as3722: move to use request_irq by IRQF_NO_AUTOEN flag
Date:   Sat, 17 Apr 2021 00:56:24 +0200
Message-Id: <161861377826.873436.9482769578157455845.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1617712475-32543-1-git-send-email-tiantao6@hisilicon.com>
References: <1617712475-32543-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 6 Apr 2021 20:34:35 +0800, Tian Tao wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable because of requesting.
> 
> this patch is made base on "add IRQF_NO_AUTOEN for request_irq" which
> is being merged: https://lore.kernel.org/patchwork/patch/1388765/

Applied, thanks!

[1/1] rtc: as3722: move to use request_irq by IRQF_NO_AUTOEN flag
      commit: 0ecab791d3fdc90ab35cd0f2c0625e11cecf0a83

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

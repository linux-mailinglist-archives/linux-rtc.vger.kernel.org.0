Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD90362BA5
	for <lists+linux-rtc@lfdr.de>; Sat, 17 Apr 2021 00:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbhDPW4X (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 16 Apr 2021 18:56:23 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:53999 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230258AbhDPW4X (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 16 Apr 2021 18:56:23 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 98FA7FF806;
        Fri, 16 Apr 2021 22:55:56 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Tian Tao <tiantao6@hisilicon.com>, a.zummo@towertech.it
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2] rtc: tps6586x: move to use request_irq by IRQF_NO_AUTOEN flag
Date:   Sat, 17 Apr 2021 00:55:55 +0200
Message-Id: <161861370729.873140.14388091691512384989.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1615812674-62449-1-git-send-email-tiantao6@hisilicon.com>
References: <1615812674-62449-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 15 Mar 2021 20:51:14 +0800, Tian Tao wrote:
> request_irq() with IRQF_NO_AUTOEN flag will disable IRQ auto-enable
> because of requesting.

Applied, thanks!

[1/1] rtc: tps6586x: move to use request_irq by IRQF_NO_AUTOEN flag
      commit: 44db35cb9bf31163d17bee2c9748e1570b81be26

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

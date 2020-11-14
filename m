Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE83C2B3136
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Nov 2020 23:39:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbgKNWjZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Nov 2020 17:39:25 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:47401 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbgKNWjY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Nov 2020 17:39:24 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id B596E240004;
        Sat, 14 Nov 2020 22:39:22 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-kernel@vger.kernel.org, Tian Tao <tiantao6@hisilicon.com>,
        a.zummo@towertech.it, linux-rtc@vger.kernel.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] rtc: cpcap: Fix missing IRQF_ONESHOT as only threaded handler
Date:   Sat, 14 Nov 2020 23:39:21 +0100
Message-Id: <160539354307.848481.11402768610763976681.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <1605000947-32882-1-git-send-email-tiantao6@hisilicon.com>
References: <1605000947-32882-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 10 Nov 2020 17:35:47 +0800, Tian Tao wrote:
> Coccinelle noticed:
> drivers/rtc/rtc-cpcap.c:271:7-32: ERROR: Threaded IRQ with no
> primary handler requested without IRQF_ONESHOT
> drivers/rtc/rtc-cpcap.c:287:7-32: ERROR: Threaded IRQ with no
> primary handler requested without IRQF_ONESHOT

Applied, thanks!

[1/1] rtc: cpcap: Fix missing IRQF_ONESHOT as only threaded handler
      commit: bc06cfc1c41e3b60b159132e5bba4c059a2e7f83

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

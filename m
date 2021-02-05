Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1230E311954
	for <lists+linux-rtc@lfdr.de>; Sat,  6 Feb 2021 04:03:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbhBFDCT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 5 Feb 2021 22:02:19 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:34249 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232063AbhBFCux (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 5 Feb 2021 21:50:53 -0500
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 2636C3BB49C;
        Fri,  5 Feb 2021 23:53:49 +0000 (UTC)
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id B0787240003;
        Fri,  5 Feb 2021 23:52:41 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Xiaofei Tan <tanxiaofei@huawei.com>, a.zummo@towertech.it
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linuxarm@huawei.com,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH 0/6] spin lock usage optimization for RTC drivers
Date:   Sat,  6 Feb 2021 00:52:41 +0100
Message-Id: <161256915201.6581.7995599057134934177.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <1612355981-6764-1-git-send-email-tanxiaofei@huawei.com>
References: <1612355981-6764-1-git-send-email-tanxiaofei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 3 Feb 2021 20:39:35 +0800, Xiaofei Tan wrote:
> Replace spin_lock_irqsave with spin_lock in hard IRQ of RTC drivers.
> There is no function changes, but may speed up if interrupt happen
> too often.
> 
> Xiaofei Tan (6):
>   rtc: cmos: Replace spin_lock_irqsave with spin_lock in hard IRQ
>   rtc: pm8xxx: Replace spin_lock_irqsave with spin_lock in hard IRQ
>   rtc: r7301: Replace spin_lock_irqsave with spin_lock in hard IRQ
>   rtc: tegra: Replace spin_lock_irqsave with spin_lock in hard IRQ
>   rtc: mxc: Replace spin_lock_irqsave with spin_lock in hard IRQ
>   rtc: mxc_v2: Replace spin_lock_irqsave with spin_lock in hard IRQ
> 
> [...]

Applied, thanks!

[1/6] rtc: cmos: Replace spin_lock_irqsave with spin_lock in hard IRQ
      commit: 6950d046eb6eabbc271fda416460c05f7a85698a
[2/6] rtc: pm8xxx: Replace spin_lock_irqsave with spin_lock in hard IRQ
      commit: 51317975565329ee50e52d0fffce50566b43cc2d
[3/6] rtc: r7301: Replace spin_lock_irqsave with spin_lock in hard IRQ
      commit: be3df3f85897e36163bfb764549acc69ec9b7afa
[4/6] rtc: tegra: Replace spin_lock_irqsave with spin_lock in hard IRQ
      commit: 669022c29af672205aaf53b76fd594dad2661ffe
[5/6] rtc: mxc: Replace spin_lock_irqsave with spin_lock in hard IRQ
      commit: 3f2d30184773e408c4e6f9e15c350828e482480c
[6/6] rtc: mxc_v2: Replace spin_lock_irqsave with spin_lock in hard IRQ
      commit: 0c1095d334dafda22463454b0519c926447b555e

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

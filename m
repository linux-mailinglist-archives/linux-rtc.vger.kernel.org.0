Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C65D531AE0B
	for <lists+linux-rtc@lfdr.de>; Sat, 13 Feb 2021 21:52:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbhBMUwY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 13 Feb 2021 15:52:24 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:48679 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbhBMUwX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 13 Feb 2021 15:52:23 -0500
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 38E49240002;
        Sat, 13 Feb 2021 20:51:37 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Marek Vasut <marex@denx.de>, linux-rtc@vger.kernel.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH] rtc: pcf8563: Add NXP PCA8565 compatible
Date:   Sat, 13 Feb 2021 21:51:36 +0100
Message-Id: <161324948772.493667.4781581676729868152.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210220623.23233-1-marex@denx.de>
References: <20210210220623.23233-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 10 Feb 2021 23:06:23 +0100, Marek Vasut wrote:
> The NXP PCA8565 is software compatible with the NXP PCF8563,
> add DT and ACPI compatible entries.

Applied, thanks!

[1/1] rtc: pcf8563: Add NXP PCA8565 compatible
      commit: 198be9898b9e62bea65f39b04d35f56d76c8bede

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

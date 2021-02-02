Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A92130D00E
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Feb 2021 00:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231277AbhBBX5K (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 2 Feb 2021 18:57:10 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:42675 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231283AbhBBX5J (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 2 Feb 2021 18:57:09 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 20D33C0009;
        Tue,  2 Feb 2021 23:56:21 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        YueHaibing <yuehaibing@huawei.com>,
        David Gow <davidgow@google.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: rtc: Make xilinx zynqmp driver depend on HAS_IOMEM
Date:   Wed,  3 Feb 2021 00:56:21 +0100
Message-Id: <161231017090.3708629.4178463549133754887.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210127035146.1523286-1-davidgow@google.com>
References: <20210127035146.1523286-1-davidgow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 26 Jan 2021 19:51:47 -0800, David Gow wrote:
> The Xilinx zynqmp RTC driver makes use of IOMEM functions like
> devm_platform_ioremap_resource(), which are only available if
> CONFIG_HAS_IOMEM is defined.
> 
> This causes the driver not to be enable under make ARCH=um allyesconfig,
> even though it won't build.
> 
> [...]

Applied, thanks!

[1/1] drivers: rtc: Make xilinx zynqmp driver depend on HAS_IOMEM
      commit: ddd0521549a975e6148732d6ca6b89ffa862c0e5

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

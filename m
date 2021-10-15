Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19F5C42FBC2
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Oct 2021 21:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242568AbhJOTOb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 15 Oct 2021 15:14:31 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:43755 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234151AbhJOTOb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 15 Oct 2021 15:14:31 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4211660002;
        Fri, 15 Oct 2021 19:12:23 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/1] rtc: pcf85063: add support for fixed clock
Date:   Fri, 15 Oct 2021 21:12:18 +0200
Message-Id: <163432513382.815620.2802314523596838985.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013074954.997445-1-alexander.stein@ew.tq-group.com>
References: <20211013074954.997445-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 13 Oct 2021 09:49:54 +0200, Alexander Stein wrote:
> TQ-Systems' TQMa8Mx module (SoM) uses a pcf85063 as RTC. The default output
> is 32768Hz. This is to provide the i.MX8M CKIL clock. Once the RTC driver
> is probed, the clock is disabled and all i.MX8M functionality depending on
> the 32 KHz clock will halt. In our case the whole system halts and a power
> cycle is required.
> 
> Referencing the pcf85063 directly results in a deadlock. The kernel
> will see, that i.MX8M system clock needs the RTC clock and do probe
> deferral. But the i.MX8M I2C module never becomes usable without the
> i.MX8M CKIL clock and thus the RTC's clock will not be probed. So
> from the kernel's perspective this is a chicken-and-egg problem.
> 
> [...]

Applied, thanks!

[1/1] rtc: pcf85063: add support for fixed clock
      commit: 4c8a7b80d5f3c924fbe08b24634fb67a97f96465

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

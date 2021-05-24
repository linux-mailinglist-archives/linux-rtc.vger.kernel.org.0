Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC7B938F59F
	for <lists+linux-rtc@lfdr.de>; Tue, 25 May 2021 00:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbhEXWbS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 24 May 2021 18:31:18 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:41549 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbhEXWbR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 24 May 2021 18:31:17 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 84AD5FF802;
        Mon, 24 May 2021 22:29:45 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, kernel@collabora.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        linux-rtc@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Saravana Kannan <saravanak@google.com>,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCHv2 0/5] Support for GE B1x5v2 and B1x5Pv2
Date:   Tue, 25 May 2021 00:29:43 +0200
Message-Id: <162189535932.209674.9024031320724831491.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210428222953.235280-1-sebastian.reichel@collabora.com>
References: <20210428222953.235280-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 29 Apr 2021 00:29:48 +0200, Sebastian Reichel wrote:
> This series adds support for another General Electric patient
> monitor series (similar to existing Bx50v3), which is based on
> i.MX6DL using Congatec's QMX6 module.
> 
> The module uses an I2C RTC to provide the i.MX6 32768 Hz clock,
> so it's important to keep it enabled. Not doing so results in
> incorrect timings of watchdog and i.MX6 RTC. The bootloader
> enables the watchdog, so disabling the clock results in system
> reboot. [0]
> 
> [...]

Applied, thanks!

[1/5] rtc: m41t80: add support for fixed clock
      commit: f765e349c3e1f2e676ad4bd61197216b26976022

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

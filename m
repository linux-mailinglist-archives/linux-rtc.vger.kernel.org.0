Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3429C1E8CD2
	for <lists+linux-rtc@lfdr.de>; Sat, 30 May 2020 03:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728293AbgE3BW0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 29 May 2020 21:22:26 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:38383 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727876AbgE3BW0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 29 May 2020 21:22:26 -0400
Received: from localhost (lfbn-lyo-1-15-81.w86-202.abo.wanadoo.fr [86.202.110.81])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 5BDC7240005;
        Sat, 30 May 2020 01:22:24 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        Anson Huang <Anson.Huang@nxp.com>, a.zummo@towertech.it
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linux-imx@nxp.com
Subject: Re: [PATCH 1/2] rtc: snvs: Make SNVS clock always prepared
Date:   Sat, 30 May 2020 03:21:53 +0200
Message-Id: <159080152194.309341.5742052779188282691.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <1590113996-31845-1-git-send-email-Anson.Huang@nxp.com>
References: <1590113996-31845-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 22 May 2020 10:19:55 +0800, Anson Huang wrote:
> In IRQ handler, ONLY clock enable/disable is called due to
> clock prepare can NOT be called in interrupt context, but
> clock enable/disable will return failure if prepare count
> is 0, to fix this issue, just make SNVS clock always prepared
> there, the SNVS clock has no prepare function implemented,
> so it won't impact anything.

Applied, thanks!

[1/2] rtc: snvs: Make SNVS clock always prepared
      commit: 20af67700bc39bccd838414128f63a72965de6e7
[2/2] rtc: snvs: Add necessary clock operations for RTC APIs
      commit: 4b957bde561f3a56865395be06f1be2c196b0b5e

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

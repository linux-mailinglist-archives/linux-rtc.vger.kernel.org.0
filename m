Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36EF02DEC90
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Dec 2020 02:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgLSA6t (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 18 Dec 2020 19:58:49 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:45919 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgLSA6t (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 18 Dec 2020 19:58:49 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E128A60002;
        Sat, 19 Dec 2020 00:58:06 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Qiang Zhao <qiang.zhao@nxp.com>, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Bruno Thomsen <bruno.thomsen@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/2] add reset-source RTC binding, update pcf2127 driver
Date:   Sat, 19 Dec 2020 01:58:06 +0100
Message-Id: <160833946513.3453721.3470869578503319105.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218101054.25416-1-rasmus.villemoes@prevas.dk>
References: <20201211215611.24392-1-rasmus.villemoes@prevas.dk> <20201218101054.25416-1-rasmus.villemoes@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 18 Dec 2020 11:10:52 +0100, Rasmus Villemoes wrote:
> This adds a reset-source RTC DT binding, as suggested by Alexandre,
> and resends Uwe's patch making use of that property in pcf2127 driver
> to avoid the driver exposing a watchdog that doesn't work (and
> potentially shuffling the enumeration of the existing devices that do
> work).
> 
> v3: elide the refactoring patch already in -next (5d78533a0c53 - rtc:
> pcf2127: move watchdog initialisation to a separate function), make
> sure to cc the DT binding list.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: rtc: add reset-source property
      commit: 320d159e2d63a97a40f24cd6dfda5a57eec65b91
[2/2] rtc: pcf2127: only use watchdog when explicitly available
      commit: 71ac13457d9d1007effde65b54818106b2c2b525

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25DDC2F3F74
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Jan 2021 01:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730315AbhALWsg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 12 Jan 2021 17:48:36 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:34007 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728030AbhALWsg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 12 Jan 2021 17:48:36 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 54A7AFF802;
        Tue, 12 Jan 2021 22:47:54 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Henning Schild <henning.schild@siemens.com>,
        Arnd Bergmann <arnd@kernel.org>, Claudius Heine <ch@denx.de>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] rtc: rx6110: fix build against modular I2C
Date:   Tue, 12 Jan 2021 23:47:53 +0100
Message-Id: <161049166687.346654.4263212004448366480.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201230145938.3254459-1-arnd@kernel.org>
References: <20201230145938.3254459-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 30 Dec 2020 15:59:11 +0100, Arnd Bergmann wrote:
> With CONFIG_I2C=m, the #ifdef section is disabled, as shown
> by this warning:
> 
> drivers/rtc/rtc-rx6110.c:314:12: error: unused function 'rx6110_probe' [-Werror,-Wunused-function]
> 
> Change the driver to use IS_ENABLED() instead, which works
> for both module and built-in subsystems.

Applied, thanks!

[1/1] rtc: rx6110: fix build against modular I2C
      commit: def8550f543e6c9101f3e1a03160b2aab8c02e8a

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

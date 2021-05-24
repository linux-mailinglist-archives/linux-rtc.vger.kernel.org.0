Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3A7B38F596
	for <lists+linux-rtc@lfdr.de>; Tue, 25 May 2021 00:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbhEXW1M (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 24 May 2021 18:27:12 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:46851 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbhEXW1L (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 24 May 2021 18:27:11 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id BDC4C240003;
        Mon, 24 May 2021 22:25:39 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Arnd Bergmann <arnd@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudius Heine <ch@denx.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-rtc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] [v2] rtc: bd70528: fix BD71815 watchdog dependency
Date:   Tue, 25 May 2021 00:25:39 +0200
Message-Id: <162189513064.208942.8503261764736710854.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210422151545.2403356-1-arnd@kernel.org>
References: <20210422151545.2403356-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 22 Apr 2021 17:15:21 +0200, Arnd Bergmann wrote:
> The added Kconfig dependency is slightly incorrect, which can
> lead to a link failure when the watchdog is a loadable module:
> 
> arm-linux-gnueabi-ld: drivers/rtc/rtc-bd70528.o: in function `bd70528_set_rtc_based_timers':
> rtc-bd70528.c:(.text+0x6cc): undefined reference to `bd70528_wdt_set'
> arm-linux-gnueabi-ld: drivers/rtc/rtc-bd70528.o: in function `bd70528_set_time':
> rtc-bd70528.c:(.text+0xaa0): undefined reference to `bd70528_wdt_lock'
> arm-linux-gnueabi-ld: rtc-bd70528.c:(.text+0xab8): undefined reference to `bd70528_wdt_unlock'
> arm-linux-gnueabi-ld: drivers/rtc/rtc-bd70528.o: in function `bd70528_alm_enable':
> rtc-bd70528.c:(.text+0xfc0): undefined reference to `bd70528_wdt_lock'
> arm-linux-gnueabi-ld: rtc-bd70528.c:(.text+0x1030): undefined reference to `bd70528_wdt_unlock'
> 
> [...]

Applied, thanks!

[1/1] rtc: bd70528: fix BD71815 watchdog dependency
      commit: b0ddc5b170058a9ed3c9f031501d735a4eb8ee89

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00BFA2F8FB0
	for <lists+linux-rtc@lfdr.de>; Sat, 16 Jan 2021 23:24:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbhAPWYB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 16 Jan 2021 17:24:01 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:44347 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbhAPWYB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 16 Jan 2021 17:24:01 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 71082FF803;
        Sat, 16 Jan 2021 22:23:18 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v5 0/3] rtc: s5m: driver improvements
Date:   Sat, 16 Jan 2021 23:23:17 +0100
Message-Id: <161083575268.91318.17275636946506516611.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210114102219.23682-1-brgl@bgdev.pl>
References: <20210114102219.23682-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 14 Jan 2021 11:22:16 +0100, Bartosz Golaszewski wrote:
> This is a set of improvements for the rtc-s5m driver. The first patch
> is new in v4: I noticed the I2C regmap is not selected by this driver's
> Kconfig. Two subsequent patches were already submitted separately.
> 
> v1 -> v2:
> - remove the remove() callback
> 
> [...]

Applied, thanks!

[1/3] rtc: s5m: select REGMAP_I2C
      commit: 1f0cbda3b452b520c5f3794f8f0e410e8bc7386a
[2/3] rtc: s5m: use devm_i2c_new_dummy_device()
      commit: 7db7ad0817fe7d3c6fcbd9402deb7509b2851f06
[3/3] rtc: s5m: check the return value of s5m8767_rtc_init_reg()
      commit: 3be95d277484117f248b2f7e8cb8d14cb38dbb04

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

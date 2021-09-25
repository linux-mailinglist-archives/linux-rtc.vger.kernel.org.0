Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E19E04184AD
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Sep 2021 23:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbhIYVbc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 25 Sep 2021 17:31:32 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:38789 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbhIYVbb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 25 Sep 2021 17:31:31 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id DD4E5240009;
        Sat, 25 Sep 2021 21:29:54 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Mark Brown <broonie@kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v1 0/3] rtc: Ensure DT compatibles have SPI device IDs
Date:   Sat, 25 Sep 2021 23:29:52 +0200
Message-Id: <163260532289.37353.8438216043985004328.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210923194922.53386-1-broonie@kernel.org>
References: <20210923194922.53386-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 23 Sep 2021 20:49:19 +0100, Mark Brown wrote:
> Currently autoloading for SPI devices does not use the DT ID table, it uses
> SPI modalises. Supporting OF modalises is going to be difficult if not
> impractical, an attempt was made but has been reverted, so this series
> adds SPI IDs where they aren't provided for a given modalias.
> 
> Mark Brown (3):
>   rtc: ds1302: Add SPI ID table
>   rtc: ds1390: Add SPI ID table
>   rtc: pcf2123: Add SPI ID table
> 
> [...]

Applied, thanks!

[1/3] rtc: ds1302: Add SPI ID table
      commit: 8719a17613e0233d707eb22e1645d217594631ef
[2/3] rtc: ds1390: Add SPI ID table
      commit: da87639d6312afb8855717c791768bf2d4ca8ac8
[3/3] rtc: pcf2123: Add SPI ID table
      commit: 5f84478e14aa8b43a4ea85d2e091931741947749

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

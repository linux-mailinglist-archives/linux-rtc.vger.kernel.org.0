Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15CC7438517
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Oct 2021 21:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231165AbhJWUAi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 23 Oct 2021 16:00:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:34146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231174AbhJWUAg (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 23 Oct 2021 16:00:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2163C61050;
        Sat, 23 Oct 2021 19:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635019096;
        bh=d5GM8INkmkLbrnWpYDwQZ0MWghsRDuj0ZeutvzDLxKI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=W69SzhXiOhJctTgMQSB+I68WSsHqZd3C3+PJNWXzOUWTid/FM3m+Z6jEb74aSRQ7N
         IhlSS+9+nnkzi1G0hzjACZLC52HBGdQfPCf+yL03mQFd5n7MomKZLijV+WZlPyQckG
         Tx3CQJB3o/JnBgxv2aFIdjKNI+l//4xKSI+0ycaZvPdcicooky6ZG4Kts4PKNclMDt
         olL2ZioKHk4bDLQkmPNrQWasFAUIBTwJLpKyC0wy9LTkRLtVFTIo0YZysXz0TNeFVo
         +lCof3ggySnP1rBF764MUK1pg8N4I6C2OXiwYkPcG4Vago8vpaaFzmz45z134vyj+q
         V1Ewog65D/Q7w==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Lee Jones <lee.jones@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     Mark Brown <broonie@kernel.org>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v1 0/3] Remove TPS80031 driver
Date:   Sat, 23 Oct 2021 20:58:03 +0100
Message-Id: <163501903136.919198.2215583761573321430.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211021192258.21968-1-digetx@gmail.com>
References: <20211021192258.21968-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 21 Oct 2021 22:22:55 +0300, Dmitry Osipenko wrote:
> TPS80031 driver was upstreamed back in 2013 and never got a user. I noticed
> that driver is abandoned while was about to write a patch to switch it to a
> new power-off API (that I'm working on). Driver requires platform data that
> nobody provides. Instead of changing the dead code, let's remove it.
> 
> Dmitry Osipenko (3):
>   rtc: tps80031: Remove driver
>   regulator: tps80031: Remove driver
>   mfd: tps80031: Remove driver
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[2/3] regulator: tps80031: Remove driver
      commit: d7477e646291b2dcdd5521cf926cd390ddd6a7c1

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

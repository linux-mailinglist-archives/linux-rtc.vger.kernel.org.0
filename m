Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58DFD411840
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Sep 2021 17:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241591AbhITPdM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 20 Sep 2021 11:33:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:57002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237965AbhITPdJ (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 20 Sep 2021 11:33:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F31AA610A8;
        Mon, 20 Sep 2021 15:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632151902;
        bh=dikphvdjrwuV/Wtyq5oEm/k9UpqBrZzEzcOf/SrF9WI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MOI1mo2X+439R34Lxe5OrIt74+zMRj4fwjFvxdT6/uSIAq1psDzXfzbpBym7mmd1C
         /Vz2/ojbNNvR6zKJJNK10nKlk32ym6H8DZUcnu47rTi7nksulJSy1lXwRJDi7Wq4FO
         5hFgYTBbwYVQbbPEdqSuNQ5cUxjDm649oUiMdGILJKpvhj69iM9AyCNNrdo0z1c2ZD
         bboTnEDF6WGGMLdNP3UhZCSauhPBvGkAgHsLiGMCuEqvjUtlEEqUy2G+Z+uTau64Ns
         e9zwAkydo5xGKHrvfcMXEyxC38lpDWVkihJe0Ha6Z4xwvgd8vcSeFuR1fcD2P6+45x
         ++Hp+y85tdQ9w==
From:   Mark Brown <broonie@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: (subset) [PATCH 1/2] rtc: rx6110: simplify getting the adapter of a client
Date:   Mon, 20 Sep 2021 16:30:45 +0100
Message-Id: <163215150720.38322.6400464183001835875.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210918213553.14514-1-wsa+renesas@sang-engineering.com>
References: <20210918213553.14514-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sat, 18 Sep 2021 23:35:51 +0200, Wolfram Sang wrote:
> We have a dedicated pointer for that, so use it. Much easier to read and
> less computation involved.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASoC: codecs: max98390: simplify getting the adapter of a client
      commit: 0f9a84b20f14f8a5039594493a1b6f9c49bf2995

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

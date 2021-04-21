Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25DB2367317
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Apr 2021 21:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245405AbhDUTFG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 21 Apr 2021 15:05:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:35698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245410AbhDUTE4 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 21 Apr 2021 15:04:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2797061453;
        Wed, 21 Apr 2021 19:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619031862;
        bh=SWgXMApMR68Fclqu0OruhI1qHub4rgqG9GwJHk4QtdI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V0QwZOn0w9ANYMCAQFlzqUvbYJvsfPsTnwoDJR7byvvRWCv+fm1JAb2NXfMPoc82U
         TNGEZ/Tac217tTZBW+JC1gvb95y6BxP6pEM/3biGRtZ5TXtZzarDuAbCP6OMjFJHY4
         myqMOaryWsoerKTuIv3ezXGPdEzyUSOnUP0dcF7/8+C42PEBOUJDsbdfVqqjFCJgE4
         yKCIoMaX4do9LxMqgCsRj0Q8rjAUR4bOzBFLVnlh9gWyyXXGNrVpiI5SpbVoZxVj1g
         prPXGk/tNM+YmWlO1fIPAQd4L3K4TahK6fgKOvU8SCDu1yolF9mj6v2k9EApp5g6Sk
         HyAeBGk7vgGkw==
From:   Mark Brown <broonie@kernel.org>
To:     linux-rtc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: Re: (subset) [PATCH 0/9] mfd/rtc/regulator: Drop board file support for Samsung PMIC
Date:   Wed, 21 Apr 2021 20:03:30 +0100
Message-Id: <161903035951.13561.16176843830665401857.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210420170118.12788-1-krzysztof.kozlowski@canonical.com>
References: <20210420170118.12788-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 20 Apr 2021 19:01:09 +0200, Krzysztof Kozlowski wrote:
> The Samsung PMIC drivers since long time are used only on devicetree
> platforms (Samsung Exynos) and there are no users with board files.
> 
> Drop the support for board files entirely and depend on OF for matching.
> 
> This makes the code smaller and simpler.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[8/9] regulator: s2mpa01: Drop initialization via platform data
      commit: 378b40ae1a8639f03192711573e478a367ccb6e1
[9/9] regulator: s2mps11: Drop initialization via platform data
      commit: beeab9bc8e85de6cacbbb2124a464166f2f5043d

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

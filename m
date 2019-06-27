Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B04B58402
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Jun 2019 15:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbfF0N7v (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 27 Jun 2019 09:59:51 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40733 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbfF0N7v (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 27 Jun 2019 09:59:51 -0400
Received: by mail-wm1-f66.google.com with SMTP id v19so5794951wmj.5
        for <linux-rtc@vger.kernel.org>; Thu, 27 Jun 2019 06:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=HZ7QyNPTvF6/RgnmII34ur/JGsTqdFkUnUKXTuvqG/w=;
        b=ooazNoLWOxU7IwbCJhoA5ND74omxfkNA0U1UpIkyKlNt0uKAfdvPmkJmQH421o+src
         vHLl/RyQplDDT1tW40Dp93vFXUKuqLfSJXg+XUzCJcoYTZZGO4+o0KU/ZfLagw0bgegz
         wZBSx99uweaNbb2vAFhf51jahF3xYUMLdJMKzZid2NhISCpPSl25DVCmAaHc/iCEvqzt
         V15JjUpQIM1tcn7pXWbEW6dhtbporZSui1zZxUUr7YTVTg347Lia76DJHNyeo5Dbwg1w
         hv1riHzjcdEwAokiYUSBUrUU76pCTDr2HpASIT86s3UXxmXaVYUxyRFIB2OcBe61Dt1L
         f56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=HZ7QyNPTvF6/RgnmII34ur/JGsTqdFkUnUKXTuvqG/w=;
        b=cJX4YVRzgGitBBhaaF+trIy+hMc5dn4aw/UOm6PR9pG7B17r4XZtCgYTx1ZJT2XMO3
         4Ju3c9QUmws4HJW+WmUcK5XHbdrjjPoU8F3An5VNiXrImFvNSWuPpPAdpLu9FS6pShvh
         UetZ5FgNTgXw1Pz4dvEdPc9iwzrbaXt7V6i6JZhm2b4v1k5xcfr93ohzzAOpw9jmBnf7
         jct1IknJj03aE4rd20DVG7u1kdLz4fx12mif/+IWdhL5icq/kqNW1Mjst9GJ+wzWG1Yf
         1pc59SnJ4AtX3VX4qyPdxcHq01oFLpGh6dqXq9F+X7DGfAp4AD5tvdHNE2GIOjrv3JQc
         lHeA==
X-Gm-Message-State: APjAAAV3bPxy1u1aAKdB9GGM1pZb3NfZDuTVwz1axmLBhCZFzPOmlLxt
        8KDiJ6ZtjyhgpC/w3UYWbobtXw==
X-Google-Smtp-Source: APXvYqwaxWiKD/K7An3E8jt0LE3Y8mQ4GeKWfysCY8bRIdbz0ryFrlEPnonTiu8gbtoYhCpar5TrSg==
X-Received: by 2002:a1c:b146:: with SMTP id a67mr3282875wmf.124.1561643989260;
        Thu, 27 Jun 2019 06:59:49 -0700 (PDT)
Received: from dell ([2.27.35.164])
        by smtp.gmail.com with ESMTPSA id y184sm5473350wmg.14.2019.06.27.06.59.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jun 2019 06:59:48 -0700 (PDT)
Date:   Thu, 27 Jun 2019 14:59:46 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Tony Xie <tony.xie@rock-chips.com>
Cc:     heiko@sntech.de, broonie@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, chenjh@rock-chips.com,
        xsf@rock-chips.com, zhangqing@rock-chips.com,
        huangtao@rock-chips.com
Subject: [GIT PULL] Immutable branch between MFD, Clk, Regulator and RTC due
 for the v5.3 merge window
Message-ID: <20190627135946.GI2000@dell>
References: <20190621103258.8154-1-tony.xie@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190621103258.8154-1-tony.xie@rock-chips.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Enjoy!

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-clk-regulator-rtc-v5.3

for you to fetch changes up to 8ed14401974830f316a419b073e58ef75a473a63:

  clk: RK808: Add RK809 and RK817 support. (2019-06-27 14:57:59 +0100)

----------------------------------------------------------------
Immutable branch between MFD, Clk, Regulator and RTC due for the v5.3 merge window

----------------------------------------------------------------
Heiko Stuebner (1):
      regulator: rk808: Add RK809 and RK817 support.

Tony Xie (4):
      mfd: rk808: Add RK817 and RK809 support
      dt-bindings: mfd: rk808: Add binding information for RK809 and RK817.
      rtc: rk808: Add RK809 and RK817 support.
      clk: RK808: Add RK809 and RK817 support.

 Documentation/devicetree/bindings/mfd/rk808.txt |  44 ++
 drivers/clk/Kconfig                             |   9 +-
 drivers/clk/clk-rk808.c                         |  64 ++-
 drivers/mfd/Kconfig                             |   6 +-
 drivers/mfd/rk808.c                             | 192 ++++++-
 drivers/regulator/Kconfig                       |   4 +-
 drivers/regulator/rk808-regulator.c             | 646 +++++++++++++++++++++++-
 drivers/rtc/Kconfig                             |   4 +-
 drivers/rtc/rtc-rk808.c                         |  68 ++-
 include/linux/mfd/rk808.h                       | 175 +++++++
 10 files changed, 1156 insertions(+), 56 deletions(-)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

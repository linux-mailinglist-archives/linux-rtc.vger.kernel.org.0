Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC69559F02
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jun 2022 19:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbiFXQ5K (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 24 Jun 2022 12:57:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231438AbiFXQ5H (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 24 Jun 2022 12:57:07 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B319353A7B
        for <linux-rtc@vger.kernel.org>; Fri, 24 Jun 2022 09:57:05 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 01B8824000F;
        Fri, 24 Jun 2022 16:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1656089823;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sJ2IhtucJNY0Bt7ziemfSGgJxt/AaaiTklkunBi/T5Q=;
        b=jy3utpUPwcWxK1fZCUilzsH0dDdOd6uMpiRySTZrgu49fKFCLQl0l0j0NQ6UTO3l/49VTj
        Am7th+5Qy6HSUE6i/Hsko/qRHkhEwaA+rgf/gxpCmpQTck2KBXjDmYcmRx3jM2Qf5ihBhc
        U0tzmbAt1VRzR1j+9E3PMuocq+ws9yzJ5u/z8mLolzyUaJcqVovGgbPT4JKLadgsJnjLKS
        A9a3iM12DdEptkrOnHc2wWqqye3mDt/73h/NL52l6LBncf6IAB0WllC8aH6pHWuBqNrXlG
        srEQkC9Lpgfep8bU+MWToelyYCk4LNJ9GAT0S7dj1m9Spji3x2lH48A0rfG1rQ==
Date:   Fri, 24 Jun 2022 18:57:00 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
Cc:     kernel@pengutronix.de, a.zummo@towertech.it
Subject: Re: (subset) [PATCH 0/5] rtc: rv8803 patches
Message-ID: <165608975938.25795.7795654292494988655.b4-ty@bootlin.com>
References: <20220426071056.1187235-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426071056.1187235-1-s.hauer@pengutronix.de>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 26 Apr 2022 09:10:51 +0200, Sascha Hauer wrote:
> This series has some patches for the rx8803 RTC handled by the rv8803
> driver. These patches mostly improve the voltage loss handling in the
> rx8803. While the rv8803 resets its registers on voltage loss the rx8803
> leaves registers in an undefined state after voltage loss. The patches
> are used here for a customer for quite a while, it's time to upstream
> them.
> 
> [...]

Applied, thanks!

[1/5] rtc: rv8803: factor out existing register initialization to function
      commit: 924e4892b167eb8adbcb2399d2b26f7667ff266d
[2/5] rtc: rv8803: initialize registers on post-probe voltage loss
      commit: 7f1a1106537217edbdc68781e95b356df8463559
[3/5] rtc: rv8803: re-initialize all Epson RX8803 registers on voltage loss
      commit: 084dc7c0072a7f93a947824d2b69883ed66a657f

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

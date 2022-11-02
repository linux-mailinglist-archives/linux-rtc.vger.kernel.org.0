Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA4E6168C4
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Nov 2022 17:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231834AbiKBQ2h (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 2 Nov 2022 12:28:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbiKBQ2T (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 2 Nov 2022 12:28:19 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69AEC2CCB7
        for <linux-rtc@vger.kernel.org>; Wed,  2 Nov 2022 09:23:45 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 57719E0009;
        Wed,  2 Nov 2022 16:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1667406224;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=12FZYtpp3TNBfA195rczrGKRPIW2epUEipXnIrnelNg=;
        b=k0kLx5rZzd3GTdZryecEd73PZ/bILTPUMEl8xEwFd0WpmFcqOjUwA2sswbg1aIY/KK9Qpg
        2p322+QVzXFJEuboQEaOq6l2p9RJ8XdkV7oAwGqGBIMHquph4Vsf90tgbaCc3Uu5H7u6IK
        A+/mGevzXNiiruQDLSoAf2TaPwnV/otXnerrR2G80QPQhiWK7oCVHE9YjPqwO+Ot2/hDMK
        Wx0iMS7291GTWK/PX0UhtCfTno/Wv63pVKPCMUQt5wESsZIxh4UR3queU0hqnr2bv7PWLC
        vRzm2QP29so2u9YmkLXWqm7kFqXJciCFMD+3KZR3mZAWFoHAfJGL9UJXqW24lA==
Date:   Wed, 2 Nov 2022 17:23:41 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Tali Perry <tali.perry1@gmail.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Nancy Yuen <yuenn@google.com>,
        Patrick Venture <venture@google.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Tomer Maimon <tmaimon77@gmail.com>
Cc:     openbmc@lists.ozlabs.org, Benjamin Fair <benjaminfair@google.com>,
        Wolfram Sang <wsa@kernel.org>, kernel@pengutronix.de,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH 0/9] rtc: Convert i2c drivers to .probe_new()
Message-ID: <166740615895.299096.14166888636281572653.b4-ty@bootlin.com>
References: <20221021130706.178687-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221021130706.178687-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 21 Oct 2022 15:06:57 +0200, Uwe Kleine-König wrote:
> See commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back
> type") for the rationale.
> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (9):
>   rtc: abx80x: Convert to .probe_new()
>   rtc: ds1307: Convert to .probe_new()
>   rtc: isl1208: Convert to .probe_new()
>   rtc: m41t80: Convert to .probe_new()
>   rtc: nct3018y: Convert to .probe_new()
>   rtc: pcf2127: Convert to .probe_new()
>   rtc: rs5c372: Convert to .probe_new()
>   rtc: rv8803: Convert to .probe_new()
>   rtc: rx8025: Convert to .probe_new()
> 
> [...]

Applied, thanks!

[1/9] rtc: abx80x: Convert to .probe_new()
      commit: 4c112e62e093b216e10fbe568e51447b9e3fee34
[3/9] rtc: isl1208: Convert to .probe_new()
      commit: 44b8ae3ed23f0e2b5bc680c0a3f4be7c5597cb78
[4/9] rtc: m41t80: Convert to .probe_new()
      commit: 52b31f00779690274c2c54eb3cd939004ac077e4
[5/9] rtc: nct3018y: Convert to .probe_new()
      commit: a9e9636a71039f5aa270091209f0580c638e341f
[6/9] rtc: pcf2127: Convert to .probe_new()
      commit: e3be426bc755cb4946ee126ec23cd94cbe42251f
[7/9] rtc: rs5c372: Convert to .probe_new()
      commit: b08e47b0c8a83f4de9676122064bf57baa4ea1e8
[8/9] rtc: rv8803: Convert to .probe_new()
      commit: 1107e384f95eeeeda2ae98f0a162b4fb9f6015cd
[9/9] rtc: rx8025: Convert to .probe_new()
      commit: 789c2c83c89957e9c27e419801c2bab3bbf7a8b0

Note that patch attestation reports bad signature on your patches.

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

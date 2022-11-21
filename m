Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 597026321F7
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Nov 2022 13:29:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbiKUM3Z (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Nov 2022 07:29:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230480AbiKUM3I (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 21 Nov 2022 07:29:08 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A882FB972D;
        Mon, 21 Nov 2022 04:28:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 609E0B80F01;
        Mon, 21 Nov 2022 12:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A158C43470;
        Mon, 21 Nov 2022 12:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669033696;
        bh=Px/rrLBJnJFW7XEVj3nOUMxyXRCVcG6+4FgfhMz4+H8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FK+vc3bAhpAOsW2BOXwNEG9mva9GBf9EYtbdvG+q4J+83TA6LicHeMys7J6zuLcWX
         NzMxdSojTVZA7j/NHWAOBmn3FkKVlGQUqk/kDHMEZPPIpxbtET2B0Ttcwk71MhPv8r
         UXqQVISpO0JYNUExKuWQXrcbEkHm3G1bX49ltui60H72QOHHI1ABK/QtNHVHr+OXNS
         K/PU839WAAiIe7zoSGl5A9LgUa8XlRE0LXVNlh/+XgkDTxryChwwXtjEnMzBP6BmZF
         SFH9CV5nGTcmbW4hqQOi+5hKbWgv9/cLaOUJ5jIRowaupR7lcLhky93kvctle9jjlW
         5ZFKVd6pERBqA==
Date:   Mon, 21 Nov 2022 12:28:09 +0000
From:   Lee Jones <lee@kernel.org>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
 bbnsm
Message-ID: <Y3tu2RKJuc4TV0RW@google.com>
References: <20221121065144.3667658-1-ping.bai@nxp.com>
 <20221121065144.3667658-2-ping.bai@nxp.com>
 <2aeb0590-4fd0-5bb4-5e68-0378953a94c3@linaro.org>
 <AS8PR04MB864223C12564CB68F5836908870A9@AS8PR04MB8642.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB864223C12564CB68F5836908870A9@AS8PR04MB8642.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

My email client takes around 20s to open your emails.

Please fix that.

    [-- Begin signature information --]
    Problem signature from: CN=nxa19010,OU=Developers,OU=Managed Users,OU=CN,OU=NXP,DC=wbi,DC=nxp,DC=com
                   aka: <ping.bai@nxp.com>
               created: Mon 21 Nov 2022 10:26:32 GMT
               expires: Mon 08 Apr 2024 10:15:04 BST
    [-- End signature information --]

-- 
Lee Jones [李琼斯]

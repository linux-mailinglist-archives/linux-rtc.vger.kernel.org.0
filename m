Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38D7858159C
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Jul 2022 16:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237981AbiGZOog (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 26 Jul 2022 10:44:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239550AbiGZOod (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 26 Jul 2022 10:44:33 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 335AB26AD9
        for <linux-rtc@vger.kernel.org>; Tue, 26 Jul 2022 07:44:32 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 1EF7F4000E;
        Tue, 26 Jul 2022 14:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1658846670;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QlIFllD92SV1e0Wm3Ne0TmkhkIkCbI4gUrB2X7fsWJU=;
        b=h1LOtzYLP3bJ0oRX/LvVFtgvV6W3RBdBrzl1NthytoS8+XadGHfJvUEFOwVKJXZ3GQAY14
        5HW90FlKQ08/vGp42sh6vZRy/LkFzkIMtwZX5BX098TLDdr/My3yYA2ResSproN7u0qnTS
        t6EBYePHVWyqkP88r2zUQfFdsBaSRY8uOK5bx3D1RzBrJR3GsayITq7sn90qBiB6xMp393
        wXo5EztXdZfvc9veoAK1shV1fxKkrUTYa18voTIGOlD06fgS1lmUIE6smcCCXnjVhtdT44
        uL9xhwO5qyYwgPWcksBxAqnpOGuYiRDlP4GE/9XZl8mgJITFqBkQws+Z28xsXg==
Date:   Tue, 26 Jul 2022 16:44:29 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     a.zummo@towertech.it, bleung@chromium.org,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     kernel@pengutronix.de, linux-rtc@vger.kernel.org,
        groeck@chromium.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH] rtc: cros-ec: Only warn once in .remove() about
 notifier_chain problems
Message-ID: <165884664842.3159950.4214538626084209259.b4-ty@bootlin.com>
References: <20220707153156.214841-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220707153156.214841-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 7 Jul 2022 17:31:56 +0200, Uwe Kleine-König wrote:
> When a remove platform device callback returns an error code, the driver
> core emits an error message ("remove callback returned a non-zero value.
> This will be ignored.\n") and still removes the device. As the driver
> already emits a more specific error message, return 0 to suppress the
> core's error message.
> 
> This is a preparation for making platform remove callbacks return void.
> 
> [...]

Applied, thanks!

[1/1] rtc: cros-ec: Only warn once in .remove() about notifier_chain problems
      commit: 5c9f41443e8d5fbd414ad0dfa8e0996b937d135a

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

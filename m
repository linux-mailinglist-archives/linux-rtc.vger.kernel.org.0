Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21E77572B5F
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Jul 2022 04:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbiGMCkk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 12 Jul 2022 22:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbiGMCkk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 12 Jul 2022 22:40:40 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 218E97435D
        for <linux-rtc@vger.kernel.org>; Tue, 12 Jul 2022 19:40:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C7D11B81C8B
        for <linux-rtc@vger.kernel.org>; Wed, 13 Jul 2022 02:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D939C3411E;
        Wed, 13 Jul 2022 02:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657680036;
        bh=VmkzAB14DLBxIZBlZROnfr8StDMPBFB9ZTFTn6CIvbA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RFjHlWWsq1LkuKZNlV/sTU82LxSBRvsNJe4fGNN4aunc+0wwXfXj+LaGO/3Shgpxu
         niyBh6DTQxwGJV9H7qKd9Yci5vbLDpAFpLzCgvC7stmGApnCsCpXZt8nwS+i9yUP2L
         b55cxCnCKFE445xcpudPIIVK8Q8iOyVyjGdXeau9hKTu8vxHyMalBCuHqhUVy+qT2c
         lxetGWHj1fZeqJsGyNKN6lk0e9rXXYqV6Iu0NBO5CbPZEA5d2UuUrVwdXWA0AWNY1O
         2r5eBTq4ZSmGAVfv5LDRf07gH3QiMyqWkP1pdo8HX19rVClixXU8P7K5XpJeXR2S0A
         xsPGGu8FXFLoQ==
Date:   Wed, 13 Jul 2022 02:40:28 +0000
From:   Tzung-Bi Shih <tzungbi@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>, linux-rtc@vger.kernel.org,
        chrome-platform@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [PATCH] rtc: cros-ec: Only warn once in .remove() about
 notifier_chain problems
Message-ID: <Ys4wnOshktFC1b0q@google.com>
References: <20220707153156.214841-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220707153156.214841-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Jul 07, 2022 at 05:31:56PM +0200, Uwe Kleine-König wrote:
> When a remove platform device callback returns an error code, the driver
> core emits an error message ("remove callback returned a non-zero value.
> This will be ignored.\n") and still removes the device. As the driver
> already emits a more specific error message, return 0 to suppress the
> core's error message.
> 
> This is a preparation for making platform remove callbacks return void.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>

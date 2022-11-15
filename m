Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2DF262A2CC
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Nov 2022 21:27:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbiKOU1B (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 15 Nov 2022 15:27:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiKOU1B (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 15 Nov 2022 15:27:01 -0500
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E6D2193D6
        for <linux-rtc@vger.kernel.org>; Tue, 15 Nov 2022 12:26:59 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 49538100004;
        Tue, 15 Nov 2022 20:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1668544018;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=k85Fc6vViL5DIkTmEYRDIgeL1DPKfj8iBW1qOTfErKo=;
        b=h/iwaL+0RFOPR+czYpm9u7iBdZT7FsdNcei9tdKVJALaHaxCyYyt+v1l3snhqq8yrDNwrv
        TXt1KFIR24oXIZEexTSvMl+RGwt4a8OlG2L7TyQKEqRtNZDBU4QQNJFDCrNGtYh7V/wkNv
        1bY4rO5XC5k5X5vIw7Fuq3n+n+vR5zNTk2S4QQh2UfF4U51OY6JzyPgoyPOnAmd14El7iq
        C3x2JJ31L2BUq2kZG/ik/j2q/B4dcWT5pO8FtcJ6HDrAe7eWdWXB04Fm+aoB1WMrLbr7xp
        GXNFFWBLkpEOVcifJzNn3etuJdtvL+Cr4LwQPT3uHEA23OAbMqoPIQxgpTXZSw==
Date:   Tue, 15 Nov 2022 21:26:57 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Francesco Dolcini <francesco@dolcini.it>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org
Cc:     Stefan Eichenberger <stefan.eichenberger@toradex.com>,
        Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v2] rtc: snvs: Allow a time difference on clock register
 read
Message-ID: <166854398415.2310791.741776177867020196.b4-ty@bootlin.com>
References: <20221106115915.7930-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221106115915.7930-1-francesco@dolcini.it>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, 6 Nov 2022 12:59:15 +0100, Francesco Dolcini wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> On an iMX6ULL the following message appears when a wakealarm is set:
> 
> echo 0 > /sys/class/rtc/rtc1/wakealarm
> rtc rtc1: Timeout trying to get valid LPSRT Counter read
> 
> [...]

Applied, thanks!

[1/1] rtc: snvs: Allow a time difference on clock register read
      commit: 0462681e207ccc44778a77b3297af728b1cf5b9f

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

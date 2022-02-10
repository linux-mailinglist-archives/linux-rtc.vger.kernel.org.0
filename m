Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20A324B19C7
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Feb 2022 00:48:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243829AbiBJXsr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 10 Feb 2022 18:48:47 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242399AbiBJXsr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 10 Feb 2022 18:48:47 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB2ED5F7F
        for <linux-rtc@vger.kernel.org>; Thu, 10 Feb 2022 15:48:46 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id v5-20020a17090a4ec500b001b8b702df57so10249841pjl.2
        for <linux-rtc@vger.kernel.org>; Thu, 10 Feb 2022 15:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+VigcQLytz0iuHCE+k+y78JnvvZ09aQp4DOS6f0o7TM=;
        b=dAh1C5a34PseGXHmaQZfM4wxYL4wwblUd5jDt5LLve2vU6jWUhtwN8MKnJNOf2qufB
         lLDHDA3elq1Y16fxoyykEwvdijWHwc7OFoKWI14jMZpOT3WpuvHCKRIZu2l8t+rAqmsE
         SJZTBCTMhb6eQRwZsHqdo4hY7alEqRycNqGHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+VigcQLytz0iuHCE+k+y78JnvvZ09aQp4DOS6f0o7TM=;
        b=k9fbwmYsm531uGPQbkSDgJSzWJ2CQ3HGwh4D2veeIRbfwtGSLDpkQW4omUaByDg5tk
         C7qEtZSHH9sKT0knpgfsxL5I7YLKH7Yh+DVnrnFc5PLpu5vkfa4TdsiaWRmpyG3WcZ50
         wBnA1r+/smern+sKeGxG+lMbjUwkcFYVIb1ZKPn3PP/1uGUJOYHuXduuRfnVQJyAyxJi
         U1Myg7CeJU3D+ZsPh4T7VhmWvKqbPU+csUbRA6abZay36ArefnpM4Qyl8rewK7/D+XjW
         eWXnWygD/YC22sd09nCtOfOFXDeKfe0gGTnB3LFcYPGg9OS8JdPZecSi5lyEUfNSLzAl
         948A==
X-Gm-Message-State: AOAM532huGsa8yvymJM07kPbSaj6SrEhrwpgKiWxVE5M1hVJbBtwGoRa
        8X6tKvHumLFpb3PUjCZi9wPKDcfMA9q/aA==
X-Google-Smtp-Source: ABdhPJw7Z7RtNFIjE/eg4qhNf5ROtPlhZI8Yn8t9OlJNY4TOQUQQi24WczGyaruM7kFjyOrv2RoZFw==
X-Received: by 2002:a17:902:ef49:: with SMTP id e9mr9590070plx.56.1644536926217;
        Thu, 10 Feb 2022 15:48:46 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j3sm18279269pgs.0.2022.02.10.15.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 15:48:45 -0800 (PST)
Date:   Thu, 10 Feb 2022 15:48:44 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Victor Erminpour <victor.erminpour@oracle.com>
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        trivial@kernel.org
Subject: Re: [PATCH] rtc: pcf8523: Fix GCC 12 warning
Message-ID: <202202101548.D2CF8DAC@keescook>
References: <1644453027-886-1-git-send-email-victor.erminpour@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644453027-886-1-git-send-email-victor.erminpour@oracle.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Feb 09, 2022 at 04:30:27PM -0800, Victor Erminpour wrote:
> When building with automatic stack variable initialization, GCC 12
> complains about variables defined outside of switch case statements.
> Move variables outside the switch, which silences warnings:
> 
> ./drivers/rtc/rtc-pcf8523.c:284:20: error: statement will never be executed [-Werror=switch-unreachable]
>   284 |                 u8 mode;
>       |
> 
> ./drivers/rtc/rtc-pcf8523.c:245:21: error: statement will never be executed [-Werror=switch-unreachable]
>   245 |                 u32 value;
>       |                     ^~~~~
> 
> Signed-off-by: Victor Erminpour <victor.erminpour@oracle.com>

Thanks for finding these! I haven't done any cross compiles with GCC 12
yet. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

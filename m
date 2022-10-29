Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E4F6611F2A
	for <lists+linux-rtc@lfdr.de>; Sat, 29 Oct 2022 03:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbiJ2BvA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 28 Oct 2022 21:51:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiJ2Bu7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 28 Oct 2022 21:50:59 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FA7F15A8DD
        for <linux-rtc@vger.kernel.org>; Fri, 28 Oct 2022 18:50:58 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id 3-20020a17090a0f8300b00212d5cd4e5eso11397361pjz.4
        for <linux-rtc@vger.kernel.org>; Fri, 28 Oct 2022 18:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h3PXA8WoOqJtml0iT1uGTlbTfROvdqqMfllOBdYkx2Q=;
        b=awzLlZFLVHNDXNPpXryI3mhfCeEtMv9n9YbmejLI6z5ubPPBOoUyQjDs4m59Db1BCx
         V2T3OEUC9/Da8SmDIj1XzAOTLlL0BGTuEGFqEpR/RYMplpUZYo+vg5GuxbjCXdkGYT8m
         1UQDY8BmvQpBexYvVRZpsIB6ICCdGHebIt7FE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3PXA8WoOqJtml0iT1uGTlbTfROvdqqMfllOBdYkx2Q=;
        b=atg4DMKnXbpuj4tyEhE7NkyS/mmKD6tvX1/bjQHO3nX7lHpxtlxBt/tG3eT0qqINEo
         Yv2FbXbSAWx2tlhH9jW0sT+72XnmLkpos15mGz7Im7u2mmJ1KRwz5ivV5rJlYCssUboJ
         zxUCMVlmWGsGGCte7NN18VRw52V/0cj09CpokNgxDhx2Ui3jfymrRvWbFWqCPFsZj63e
         P5O6hqJmMg++sglBCBJOZ2HSafmUcR9qjJqTihT0oc0w3T6bqB/Hzen/uKiYewg9ek36
         /2VkKdrfD32dXcd3heRL6XM9+1Maj/+5xgcwCHAivQFiERWUbbcg5mFHc3/qBto9Q7u6
         rFaQ==
X-Gm-Message-State: ACrzQf3rfMMJoc64+oF09cz0UfuB963O/9K5nEqhFLQfnqMvFrh6DDLK
        T38WJ3EwvJr5cIYqibo4iQroCMFe+kNDmQ==
X-Google-Smtp-Source: AMsMyM74IKJH+Zx3Kp0oOuv3LYOmcgGJw9CYoCx/iN7nC5ZnsoprbaFozTj05a80SX2TN7KTgTEMFA==
X-Received: by 2002:a17:903:2645:b0:185:480a:85d2 with SMTP id je5-20020a170903264500b00185480a85d2mr2049552plb.144.1667008257609;
        Fri, 28 Oct 2022 18:50:57 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:65f9:c180:249c:190f])
        by smtp.gmail.com with ESMTPSA id q8-20020a17090a304800b00212daa68b7csm84981pjl.44.2022.10.28.18.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 18:50:57 -0700 (PDT)
Date:   Fri, 28 Oct 2022 18:50:54 -0700
From:   Brian Norris <briannorris@chromium.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Benson Leung <bleung@chromium.org>, linux-rtc@vger.kernel.org,
        chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: cros-ec: Limit RTC alarm range if needed
Message-ID: <Y1yG/lhDYH2I82Bi@google.com>
References: <20221029005400.2712577-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221029005400.2712577-1-linux@roeck-us.net>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Oct 28, 2022 at 05:54:00PM -0700, Guenter Roeck wrote:
> RTC chips on some older Chromebooks can only handle alarms less than 24
> hours in the future. Attempts to set an alarm beyond that range fails.
> The most severe impact of this limitation is that suspend requests fail
> if alarmtimer_suspend() tries to set an alarm for more than 24 hours
> in the future.
> 
> Try to set the real-time alarm to just below 24 hours if setting it to
> a larger value fails to work around the problem. While not perfect, it
> is better than just failing the call. A similar workaround is already
> implemented in the rtc-tps6586x driver.
> 
> Drop error messages in cros_ec_rtc_get() and cros_ec_rtc_set() since the
> calling code also logs an error and to avoid spurious error messages if
> setting the alarm ultimately succeeds.
> 
> Cc: Brian Norris <briannorris@chromium.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Brian Norris <briannorris@chromium.org>
Tested-by: Brian Norris <briannorris@chromium.org>

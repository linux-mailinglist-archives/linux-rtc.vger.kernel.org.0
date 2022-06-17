Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4743354FD3A
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Jun 2022 21:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234232AbiFQTFC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Jun 2022 15:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233914AbiFQTFB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 17 Jun 2022 15:05:01 -0400
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B37A434B5;
        Fri, 17 Jun 2022 12:05:01 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id m16so2056291ilf.6;
        Fri, 17 Jun 2022 12:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bKcbLlkyCbAnB5gZdBpLoJmB78rwGrXGwU1yaExEezI=;
        b=MFZTOaj++KifBU1+wMvVvQV3utWn5OZs7IMD14MHbdDrQFklx1cXSBYF0ermgvQr21
         NkhaTvbjFNpxkEsd8uA7JsxAr7wiq0tpl/bESrdBMrzTNGMnra6EDttvRd3IIbdX82Bg
         6FSBYnBjGQ6riA/r4nH7+ac1yymlwNJj4/PLPOcF0i94veEJc1fRWhJMV0gCM1LPmMfX
         7FeZ4BumJwE50G8MYtZ7xOaUTdZQQAPKD1XBZYL7gZOeh7S1OnBdJc7jkttU7f65LO+E
         97z9xcreZf/FLN2yrlqQgVS49Gs8IYrKtORYeaPkRVoO+tyeq+2olTeHmaX6Zsuk1n6Y
         Ey/w==
X-Gm-Message-State: AJIora+Z8zYjS71OUf+ebIiP7VE3TNecY1STy/0w+7ug2GN9bK7X/5Sl
        2pSRszoKJxJuqd1VKo1X4pl+g3D2gg==
X-Google-Smtp-Source: AGRyM1tJsm5j4+SmmyX8YfSNnb/n80qR2zSsIfI/M2JZP59Mz2nNfsZk9d0Ov6kNIT2K4MqLphFmVA==
X-Received: by 2002:a05:6e02:1b84:b0:2d3:5b9f:50d6 with SMTP id h4-20020a056e021b8400b002d35b9f50d6mr6231369ili.247.1655492700592;
        Fri, 17 Jun 2022 12:05:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id x10-20020a92dc4a000000b002d1a37f23c9sm2662651ilq.57.2022.06.17.12.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 12:05:00 -0700 (PDT)
Received: (nullmailer pid 2111511 invoked by uid 1000);
        Fri, 17 Jun 2022 19:04:59 -0000
Date:   Fri, 17 Jun 2022 13:04:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: rtc: Add EM Microelectronic EM3027
 bindings
Message-ID: <20220617190459.GA2111440-robh@kernel.org>
References: <20220617114420.1398259-1-thierry.reding@gmail.com>
 <20220617114420.1398259-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617114420.1398259-2-thierry.reding@gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 17 Jun 2022 13:44:20 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Document the bindings for the EM Microelectronic EM3027 RTC.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - add to list of trivial RTCs
> 
>  Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

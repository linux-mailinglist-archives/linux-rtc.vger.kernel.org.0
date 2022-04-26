Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4CC8510A05
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Apr 2022 22:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237467AbiDZUQn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 26 Apr 2022 16:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245167AbiDZUQm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 26 Apr 2022 16:16:42 -0400
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5954B1848F1;
        Tue, 26 Apr 2022 13:13:34 -0700 (PDT)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-e9027efe6aso13266773fac.10;
        Tue, 26 Apr 2022 13:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R+tJ++uKMm4syPuzQI6ULOL9nUzZ2aA5+1OHC9pGsFA=;
        b=IJOhTqAWm4nL79Hg+G1c8B/NA9t65kQuaJeIVDx8/FgwQebEZTnR8e+P/wBzpA6jKX
         QYcklWXJ8g9XQZIHjwElXjCWT1+qI6rcW6cH5YvxKdaAS2GH/tDyVoU7CHPGr8zsPp46
         n+AMV7VRApXD5rOrj8MksdOgGlUlzbMcxhnOzXkngbZhVnFZvTc4a3sSzSj8pCnrLyLR
         cVHfBAGVugzaXM208WFplSg+MgFg2vCrZQjhQT+R2pjc+fsvnPQ1/ML1PdrUkWabQ+91
         WoO9vuTSTDM72LyCYKywvayV219+JBBhxc7GCuCHCADQnvvMpPpu8Go4mb0OkVUFA1Ur
         M9eA==
X-Gm-Message-State: AOAM5301J8b+isSH1G5iNni7s8PmHlJPq+xe27m1zb44w2sNsd50QfY6
        hJDOmh2xJ3IGbsSNFqLvZ2qTtaHnXg==
X-Google-Smtp-Source: ABdhPJxtCRRa7InlyRGyPTJibvEJVV9OMeA/5C+AZTqFLX2MU44W6xcJv259shTxs36Hni/eYxR1Fw==
X-Received: by 2002:a05:6870:c5a5:b0:da:ab36:48dd with SMTP id ba37-20020a056870c5a500b000daab3648ddmr9920986oab.150.1651004013707;
        Tue, 26 Apr 2022 13:13:33 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j5-20020a4a9445000000b00329dab1a07fsm5937690ooi.17.2022.04.26.13.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 13:13:33 -0700 (PDT)
Received: (nullmailer pid 2461137 invoked by uid 1000);
        Tue, 26 Apr 2022 20:13:32 -0000
Date:   Tue, 26 Apr 2022 15:13:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     alexandre.belloni@bootlin.com, Fabio Estevam <festevam@denx.de>,
        linux-rtc@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-binding: pcf85063: Add an entry for pca85073a
Message-ID: <YmhSbA/W1NM7ISbP@robh.at.kernel.org>
References: <20220419014445.341444-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419014445.341444-1-festevam@gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 18 Apr 2022 22:44:44 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The PCA85073A RTC has the same programming model as the PCF85063A.
> 
> Add a compatible entry for it.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  Documentation/devicetree/bindings/rtc/nxp,pcf85063.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

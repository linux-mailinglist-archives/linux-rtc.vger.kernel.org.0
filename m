Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F83857D626
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Jul 2022 23:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233918AbiGUVhg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 21 Jul 2022 17:37:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233433AbiGUVhf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 21 Jul 2022 17:37:35 -0400
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2E3393630;
        Thu, 21 Jul 2022 14:37:34 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id u20so2380436iob.8;
        Thu, 21 Jul 2022 14:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+0HdgmCZ+Rln6MS1n8RXhMBDElcjUol5xkuMakNkAN4=;
        b=GAm5qqlDI+YXkaAZKkKFiHmcHQbusTWeciw0PqBamc5ZfyyOuACg6pIYcV5OyKIDx5
         HJyJJBf3kUpP7WAPJ2mAC1YJv37zfVgchEHeY7Ut3YL8OGCKhsNhfvx58kQ6jOFvcw6/
         uyYE9lriuwM/4ONaHhFxXo7UVo2BGC9wznnDzQoThO33fgNyY5sfN/yHZc1J13OhA8Yq
         9C7HdrgtPagpCxMqEIG3CmL3jpI7Udvl8hDNUfGSPQAMcLNWxde07+ROfDNsiuLYn1+g
         zXpPP0m3IWRmGRvsXK0e1fECpZ8c8CiEBrY/dAaeuf4LLgPXPNeH/rMdpXwX9Mik7F7a
         zp3Q==
X-Gm-Message-State: AJIora+Fyi1vNiTi7lRpVDvs8UFQ5K6ESxacz4trPhV97yrARvoWetxZ
        2H6ZSXd1/BWiTItpYrvf15HIF2GftQ==
X-Google-Smtp-Source: AGRyM1tW45Lc/rpN/g5qpyrJC/pQA3Y5vk6C4+J0XnxZmoG7s2P2KyKAwpFNwXEyhBXFax/JrozEKg==
X-Received: by 2002:a02:9705:0:b0:341:468c:7724 with SMTP id x5-20020a029705000000b00341468c7724mr225657jai.143.1658439454145;
        Thu, 21 Jul 2022 14:37:34 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q12-20020a92d40c000000b002dd0f4b440fsm1081352ilm.67.2022.07.21.14.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 14:37:33 -0700 (PDT)
Received: (nullmailer pid 1994823 invoked by uid 1000);
        Thu, 21 Jul 2022 21:37:32 -0000
Date:   Thu, 21 Jul 2022 15:37:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: ds1307: Convert to json-schema
Message-ID: <20220721213732.GA1993841-robh@kernel.org>
References: <20220617114420.1398259-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617114420.1398259-1-thierry.reding@gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 17 Jun 2022 13:44:19 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the DS1307 (and compatible) RTC bindings from the free-form text
> format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - add compatible string list for [ st,m41t00, dallas,ds1338 ]
> - allow second interrupt and interrupt-names
> - remove commented-out section
> - allow vcc-supply
> 
>  .../devicetree/bindings/rtc/rtc-ds1307.txt    |  52 ---------
>  .../devicetree/bindings/rtc/rtc-ds1307.yaml   | 102 ++++++++++++++++++
>  2 files changed, 102 insertions(+), 52 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-ds1307.yaml
> 

Looks like this hasn't been picked up so I've applied both patches, 
thanks!

Rob


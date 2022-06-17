Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 482C754FD43
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Jun 2022 21:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbiFQTEv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Jun 2022 15:04:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234102AbiFQTEu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 17 Jun 2022 15:04:50 -0400
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E823344756;
        Fri, 17 Jun 2022 12:04:49 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id y79so5444614iof.2;
        Fri, 17 Jun 2022 12:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=joRfIL/eN7k8ifMl77EtwTHOeVU5DdMlLc1FNEqs7Wc=;
        b=Tsn53P/yBIlHYz1Xw4kANQfjgJx35yLez2c4lhTNGmX6iNp57jv5PKc4aSHWzKOBUf
         iJqlbgsXI9N/ozN6vjm7K4nNIeCJf/+hKmbt9qWqPvFSsG1bwlW6rA/wVXqzT2CbFPT5
         D2ejXYCST7kpwM3OE8HvIxXQGYlR0M261S1oS/JUgdra7GOGwR/h/dKDxZqb1FsAQ3mY
         F1FoFLzsARqF6I1BeZpj0v39MWpsUy9zbtX3quWLNwxEXcQdHGjvZBh8psG5sLCa2NlD
         9FVzIWOhWF+K34ka30xL57KEHRjtqeR7GPpcxrArtP4S2VpAGzIHhFKwyJtxYrJvKeb+
         P/EQ==
X-Gm-Message-State: AJIora81gkwccD24aI0w57IfsrFa9FQcWZ6/iTM49P2n8IU3FrbkWC+K
        9AP/v0tCu6VV7JRL+ub4DshCFdVnLg==
X-Google-Smtp-Source: AGRyM1vgSvLiPkeOXgOWG8cNtVDgQlyYdM+YmZs1sMYEuBdQAnKRmwJLtIj5lXTAlcBj1kO/NcOKOw==
X-Received: by 2002:a05:6638:3729:b0:332:1c7e:91f7 with SMTP id k41-20020a056638372900b003321c7e91f7mr6106962jav.84.1655492689172;
        Fri, 17 Jun 2022 12:04:49 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id q13-20020a0566380ecd00b003315a20c6e1sm2535672jas.9.2022.06.17.12.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 12:04:48 -0700 (PDT)
Received: (nullmailer pid 2111168 invoked by uid 1000);
        Fri, 17 Jun 2022 19:04:47 -0000
Date:   Fri, 17 Jun 2022 13:04:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-rtc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: ds1307: Convert to json-schema
Message-ID: <20220617190447.GA2111063-robh@kernel.org>
References: <20220617114420.1398259-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617114420.1398259-1-thierry.reding@gmail.com>
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

Reviewed-by: Rob Herring <robh@kernel.org>

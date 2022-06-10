Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 703C6546FDA
	for <lists+linux-rtc@lfdr.de>; Sat, 11 Jun 2022 01:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344836AbiFJXJ6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 10 Jun 2022 19:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343526AbiFJXJ6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 10 Jun 2022 19:09:58 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF5D6101DA;
        Fri, 10 Jun 2022 16:09:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5E1EBB8368D;
        Fri, 10 Jun 2022 23:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247F5C34114;
        Fri, 10 Jun 2022 23:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654902593;
        bh=6gWP0ORNgmh/fnFbCfeBYRD93PXSrr2UERHIs2D9YiA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OohojePok6cqA1Pbdr/IDb7No1miIkaxIxh62sTYejrVAdw91ZA8fv3NJz0A+dYMl
         P/2WeOp+BFs9EhbcJ1wFB2hkrFiRkyL9l071FK6WOq0e5L0B82WK5mx2IrTE3QWOGT
         Z/I5IjuilPpi4mxhYh3hB+ogqSNlvP9UeEY6vprlDWHxudzvEUN3UYQsuikcXFRQDQ
         nVFsYklyF91zA/ZNkavPJ9guIYMHfwMsfdMxsj7Aeo3tyUMUiVTh7AGHw/V2t/0fnC
         xAIbjWeHap188aqrgyAu81MSUIHRxa1CsfQqYL7vprmDGGUUiAQYYa71m2AjCvD8NR
         Udfsq9gpLO4TA==
Received: by mail-ua1-f42.google.com with SMTP id z20so145800ual.3;
        Fri, 10 Jun 2022 16:09:53 -0700 (PDT)
X-Gm-Message-State: AOAM533GUOjEOc/PlRekKeMa56gRc7+Ql9EzLHlLjfEobJSHxpYOW7rP
        y36aRm9NKjq0hi0/ogUr9lcRPcgepaiIQndbkA==
X-Google-Smtp-Source: ABdhPJxwkEXRiry4ldAqEcoQWlDmyv7yXcBRNZxy7rlvOsoJOURcmxD8m76xhbZnU2IoKz3PTjJJRmHt/EBhyx9Vxjg=
X-Received: by 2002:ab0:5a95:0:b0:369:1a3f:358c with SMTP id
 w21-20020ab05a95000000b003691a3f358cmr33468467uae.63.1654902592121; Fri, 10
 Jun 2022 16:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211217170311.2796798-1-thierry.reding@gmail.com>
In-Reply-To: <20211217170311.2796798-1-thierry.reding@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 10 Jun 2022 17:09:41 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLSJS_AThMfDOiZ2txC4K=9WCYEKw2TVzEM+tSD2W2qGA@mail.gmail.com>
Message-ID: <CAL_JsqLSJS_AThMfDOiZ2txC4K=9WCYEKw2TVzEM+tSD2W2qGA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: rtc: ds1307: Convert to json-schema
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Dec 17, 2021 at 10:03 AM Thierry Reding
<thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Convert the DS1307 (and compatible) RTC bindings from the free-form text
> format to json-schema.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/rtc/rtc-ds1307.txt    |  52 ---------
>  .../devicetree/bindings/rtc/rtc-ds1307.yaml   | 104 ++++++++++++++++++
>  2 files changed, 104 insertions(+), 52 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-ds1307.yaml

Was about to convert this one, too. Are you going to respin it?

Rob

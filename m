Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A60443BDC8
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Oct 2021 01:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240262AbhJZXYn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 26 Oct 2021 19:24:43 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:41533 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240253AbhJZXYm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 26 Oct 2021 19:24:42 -0400
Received: by mail-ot1-f48.google.com with SMTP id v2-20020a05683018c200b0054e3acddd91so987914ote.8;
        Tue, 26 Oct 2021 16:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BlYVCtsIK/ZHSSJFn7jPTA8DCkAvMMkyiTdquv+XGLo=;
        b=7FxMJMhA9E57FyQL5zYfCX2S+HLbFpnV6yaNTh95ogc6+z1OmTQo7qtrp/aKNIYcAJ
         Ybvq6ULBiNg8N/I0oIxse/CfEqG1+DiYO7EXvBVwaunxsy4fNQLqmbBCCLtptk9QVTPX
         MuI50Fxf3Jr0yhpbddkMedfD/zIxBugGW6LW9nfP3q0L9vqnaba/311H8Ey11D9zFXtR
         sOeNMvXI7ZIlN0/hy9hdBuldAPuKl0OegUa0LjugbM+ZNrPI3NWgQuwC6az6fnSg8t8t
         gkwl8Dd9TjYk2BMyhcdbJBu8YY5FMMIIyRdm/XlChfkHY8oylxJBNruOXTWbk4MWmB8y
         99Aw==
X-Gm-Message-State: AOAM532iL/onpGl7Bt7Y6SpiKdxIa9K8ICLD1pZcxernojNHvA7YXoeh
        KsUPa09hYHdXK1L6rkuySw==
X-Google-Smtp-Source: ABdhPJyn70qD8VYRezNuvSOoBBWUBQ7fgcqQi1lPKHXEkDA4p5nn9yrQDtvHoy8o22bFmiPQVQFjxw==
X-Received: by 2002:a9d:758f:: with SMTP id s15mr21725078otk.78.1635290538156;
        Tue, 26 Oct 2021 16:22:18 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l25sm4258274oot.36.2021.10.26.16.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 16:22:17 -0700 (PDT)
Received: (nullmailer pid 3505593 invoked by uid 1000);
        Tue, 26 Oct 2021 23:22:16 -0000
Date:   Tue, 26 Oct 2021 18:22:16 -0500
From:   Rob Herring <robh@kernel.org>
To:     Alexey Firago <alexey_firago@mentor.com>
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: rtc: Add Maxim Integrated MAX31343
Message-ID: <YXiNqGVDfYHSLgL/@robh.at.kernel.org>
References: <20211016192118.255624-1-alexey_firago@mentor.com>
 <20211016192118.255624-3-alexey_firago@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211016192118.255624-3-alexey_firago@mentor.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sat, 16 Oct 2021 22:21:18 +0300, Alexey Firago wrote:
> It is supported by the rtc-max31343 module.
> 
> Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
> ---
>  Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

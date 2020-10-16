Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 008E8290A97
	for <lists+linux-rtc@lfdr.de>; Fri, 16 Oct 2020 19:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391539AbgJPRXV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 16 Oct 2020 13:23:21 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:35714 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391280AbgJPRXV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 16 Oct 2020 13:23:21 -0400
Received: by mail-oi1-f194.google.com with SMTP id w141so3251130oia.2;
        Fri, 16 Oct 2020 10:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vR3ghSOELOYTJTOfaVyDLWbF1zqc1bqRhAnEnKY/Ykw=;
        b=r3teT3OZCgaPKtCj00Iq6mMdF1N5xU5Q4FaTWF9f3JAr1fqAuq1ou50cP1vROuGW84
         hLL1o+iEjSiTz/NVv1rhDq9tulZocqzan9oprCIng52Q7jr5U341JT8eC9FgiwHibFCG
         iRHrkfNnJGVjWdHcbs+SI8V1ZsNpGGODwOWv2pTd+rvoUSO2abwujcQqV2jTV5EqWLNy
         0fNfzdl1XqL8LWzjDFZRfjNrbMl4bVkZjcIbzOhv86NNaO+8uIxvy87xwTxg8p8ldfdb
         qivzK/8Xjvnpg1npuyGRHDNnYbKG2dXDGgz0kWF+Np5VakXfapxB4qiu8p8Yw7JWXW9U
         yx2w==
X-Gm-Message-State: AOAM530YihofuKmiZrxj0MQ+KmDLMSny5w5SjkpA11dYAoSS9s86A8Ko
        f9MJowmsUR8VwFGOMGPeGQ==
X-Google-Smtp-Source: ABdhPJyA1guI+ypVqv9vrMlMKT8av3CawqFG7YW8V/YF29snJA01/0AARn84sJVwRsiBnBakduyPUQ==
X-Received: by 2002:aca:fc89:: with SMTP id a131mr3199481oii.163.1602868998945;
        Fri, 16 Oct 2020 10:23:18 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t65sm1202250oib.50.2020.10.16.10.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 10:23:18 -0700 (PDT)
Received: (nullmailer pid 1605378 invoked by uid 1000);
        Fri, 16 Oct 2020 17:23:17 -0000
Date:   Fri, 16 Oct 2020 12:23:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: rtc: add trickle-voltage-millivolt
Message-ID: <20201016172317.GA1605329@bogus>
References: <20201013144110.1942218-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013144110.1942218-1-alexandre.belloni@bootlin.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 13 Oct 2020 16:41:08 +0200, Alexandre Belloni wrote:
> Some RTCs have a trickle charge that is able to output different voltages
> depending on the type of the connected auxiliary power (battery, supercap,
> ...). Add a property allowing to specify the necessary voltage.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
> 
> changes in v3:
>  - actually use -millivolt instead of -mV
> 
>  Documentation/devicetree/bindings/rtc/rtc.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

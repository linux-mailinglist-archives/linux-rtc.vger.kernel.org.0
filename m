Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73BCC357A73
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Apr 2021 04:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbhDHChK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 7 Apr 2021 22:37:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbhDHChK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 7 Apr 2021 22:37:10 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06E84C061762
        for <linux-rtc@vger.kernel.org>; Wed,  7 Apr 2021 19:37:00 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id 125-20020a4a1a830000b02901b6a144a417so141384oof.13
        for <linux-rtc@vger.kernel.org>; Wed, 07 Apr 2021 19:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sNt0N9k5A/iZhS6mLH3QqBzCSSb0518KO9+l8szb88c=;
        b=LUf8Eiojwyx3AkSHJqCIk3X+PIGMeWOQGjVQfUNYCrrKhnGPtxvNMeITP4theeZA4s
         TXvOTOWeYg9JjM4Q1J8GpAKIT9XqTZrCzvb7I5vwvfLR6j/RESBDguI0jSK1LEIuxZrf
         p6cSNv43h8Lp43xBgDvkuR1HanutyH1eCekF9EKytvEAkmjjUsyAPiG3NEZpk32F7UV/
         l3WRmf8e9Eb9ov6gjNMcAkuWOQjxZRR7O69/xXXVIV532y7tLSXjQtBn1XX4Z0GO3TZC
         HYCx0wNGD0llxL3YX20aku6rh3xYYZTPyRcpzkGPg2gPKaywceMWIxfh/53o77I7XJlU
         mCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sNt0N9k5A/iZhS6mLH3QqBzCSSb0518KO9+l8szb88c=;
        b=TJZg67IBkt0LJYYLt5EbVwNNtIdfkPLmyBjZ115HsKY9fBPbFkPjO1qhtBWhVvg9y9
         ogOidMNBJaRQHXbJvqvKwwpja66byFZ4gSxrm6lP9dqOW55n0wgg4mv3idRwPi8ZkDqd
         J9rczG1rASIQH1unuvF0Ass4y63mdud6prbWOz6xDQONb8nX4zGbD4krfQH7tD3eFJ7Q
         4xkvuc5yEIxmDivZ66pmXqVxa2sh8SLIgh1sXceoElqd1NLDWv2dVKonMqrgo++e9opq
         h5DY1fHAPx2RtW8So5XCCPW/1PQaGa3/BM1K0bzs2/ag085cA/iot/6JCDymg2arWnD8
         Hg2Q==
X-Gm-Message-State: AOAM533r+SIPhQlohhHJIOX9UjktpybUvwrPumvheM5mYLvWVhK6kUm3
        NcBEIQgUSIwlh6FMYu+3JusWTg==
X-Google-Smtp-Source: ABdhPJxwHieceqi2i/XhpJhh/5S87/OOgtYfASCGY0aWMHBjw4edQyRluei4ZPIjwLYRu5LlhzIbpA==
X-Received: by 2002:a4a:d24c:: with SMTP id e12mr5522553oos.73.1617849419360;
        Wed, 07 Apr 2021 19:36:59 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 3sm4532103oti.30.2021.04.07.19.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 19:36:58 -0700 (PDT)
Date:   Wed, 7 Apr 2021 21:36:56 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     skakit@codeaurora.org, Rob Herring <robh+dt@kernel.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, linux-rtc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH 2/3] dt-bindings: mfd: Convert pm8xxx bindings to yaml
Message-ID: <20210408023656.GM904837@yoga>
References: <1615447798-6959-1-git-send-email-skakit@codeaurora.org>
 <1615447798-6959-3-git-send-email-skakit@codeaurora.org>
 <YEpNV55KR2nlAXMP@builder.lan>
 <86f8d5dbdb8d5d6627b9deece1978d07@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86f8d5dbdb8d5d6627b9deece1978d07@codeaurora.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed 07 Apr 10:37 CDT 2021, skakit@codeaurora.org wrote:

> Hi Bjorn,
> 
> On 2021-03-11 22:33, Bjorn Andersson wrote:
> > On Thu 11 Mar 01:29 CST 2021, satya priya wrote:
[..]
> > > +patternProperties:
> > > +  "rtc@[0-9a-f]+$":
> > 
> > Can we somehow link this to individual binding docs instead of listing
> > all the possible functions here?
> > 
> 
> you mean we should split this into two:
> qcom-pm8xxx.yaml and qcom-pm8xxx-rtc.yaml
> Please correct me if wrong.
> 

Right, I'm worried that it will be quite hard to maintain this document
once we start adding all the various pmic blocks to it. So if we somehow
can maintain a series of qcom-pm8xxx-<func>.yaml and just ref them into
the main PMIC definition.

@Rob, can you give us some guidance on how to structure this binding,
with the various PMICs described will have some defined subset of a
larger set of hardware blocks that's often shared between versions?

Regards,
Bjorn

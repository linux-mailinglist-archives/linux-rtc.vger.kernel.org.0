Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42CF135D02D
	for <lists+linux-rtc@lfdr.de>; Mon, 12 Apr 2021 20:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236593AbhDLSWC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 12 Apr 2021 14:22:02 -0400
Received: from mail-oi1-f180.google.com ([209.85.167.180]:43717 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230336AbhDLSWB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 12 Apr 2021 14:22:01 -0400
Received: by mail-oi1-f180.google.com with SMTP id a21so1287920oib.10;
        Mon, 12 Apr 2021 11:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lPF+TWzAvfvDArI2uAx9AEu6mTL5FkKSGiZRnWnK/XY=;
        b=Rvv2cAZkvA0A5Vss32DMe3Tnu6ShB8VSHYxNW9XUld/n30UQYAAkeSzOOXXcBwsSvj
         VaepAcCjo8L93dzTAQJod7J8rkrb8lHtC4wdQ5AaohP3c2wiLMpQv+GH91tHgfvQ6XKW
         a/cZ1I2kHqmJWMWeYits1UnQy+CR/GpOi93RI2nU0Ruxongo98+YPXeTBHJMCehmC77P
         xqrFAhGHk8cSD7B5mhpV3AdN1we9+01LqFVSe75eoovnRG+7pIgIf9SnvcO0mO4IOIZJ
         vXYCIaPwp9e+OEHJ/q6UIJXmSkSVKHwnD9JUUSA/JZPF+j40BNZWyVUVpT7lrKAzr0WX
         IQKg==
X-Gm-Message-State: AOAM530sA+D1Y3CMmuUXTzKNyqBsT8AhCai4dID3Bh6+p7mKaNs7tCKR
        j7jOsM5terSl9sbxsuOuCw==
X-Google-Smtp-Source: ABdhPJy3eiwmml1iJWpx0Qj2gq8OOyHs0QHVZBVzsPOGL7uYfZckBDg/1tDoTQ8Xl98fE7MuU7ekvw==
X-Received: by 2002:aca:ad57:: with SMTP id w84mr352869oie.100.1618251702775;
        Mon, 12 Apr 2021 11:21:42 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i4sm2828972otj.56.2021.04.12.11.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 11:21:42 -0700 (PDT)
Received: (nullmailer pid 4150545 invoked by uid 1000);
        Mon, 12 Apr 2021 18:21:41 -0000
Date:   Mon, 12 Apr 2021 13:21:41 -0500
From:   Rob Herring <robh@kernel.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        kgunda@codeaurora.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH V2 3/4] dt-bindings: mfd: Convert pm8xxx bindings to yaml
Message-ID: <20210412182141.GA4150488@robh.at.kernel.org>
References: <1617976766-7852-1-git-send-email-skakit@codeaurora.org>
 <1617976766-7852-4-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617976766-7852-4-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 09 Apr 2021 19:29:25 +0530, satya priya wrote:
> Convert pm8xxx bindings from .txt to .yaml format. Also,
> split this binding into two: parent binding(qcom-pm8xxx.yaml)
> and child node RTC binding(qcom-pm8xxx-rtc.yaml).
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V2:
>  - As per Bjorn's comments, I've split this into two, one parent binding
>    and one child node rtc binding.
>  - Fixed bot errors and changed maintainer name.
> 
>  .../devicetree/bindings/mfd/qcom-pm8xxx.txt        | 100 ---------------------
>  .../devicetree/bindings/mfd/qcom-pm8xxx.yaml       |  54 +++++++++++
>  2 files changed, 54 insertions(+), 100 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

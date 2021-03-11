Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED2F6337A5F
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Mar 2021 18:05:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbhCKRFU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 11 Mar 2021 12:05:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbhCKREv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 11 Mar 2021 12:04:51 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A42AEC061761
        for <linux-rtc@vger.kernel.org>; Thu, 11 Mar 2021 09:04:51 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id o22so14123985oic.3
        for <linux-rtc@vger.kernel.org>; Thu, 11 Mar 2021 09:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HcdutmO19zaKE2AyPz8/OHl7hJh6xIt+CzDBadJIgpw=;
        b=OSr6XHSRLkmL8Q4c2CFZXveBS/Yh/p8ICQ/NhU9qbY9OJhhPE9c7uvJZ1oy7e3nV+Z
         +6Bc2NusSzrKGF38S7s5qUxQVcJWvysrPceGUb8W6YxPOhrHgTx3qWsTfp2kK2BJu8aH
         +8VcyJoX3Ys+t6QwxoVDtqcD6i5Fbzmr6kGzIi2DPyErRYrfMimHxq9OayvnXGScRo+l
         WckR0IyJLx1G/vyoolIVXDjc1gCBvC0XU9ZQXqPd11t/ReVFDvW8HObxKynn8+8GfBrs
         /4PGskZGth1xcWzHTPxhVdGoS9vliWcxXTUdUIhjbInZgDWSMVHI0spxg5dTLrjak6c/
         TTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HcdutmO19zaKE2AyPz8/OHl7hJh6xIt+CzDBadJIgpw=;
        b=exYz3kbHGtvsLgp00UtWrwr/ziqSeBM1z89T3emBcoEdaOi8ACXf43f7Pv/+UfdG8l
         WDwfcTc4c37wwEXt/F27MgfUhygpRGOPHZOSSky5NQU7MKbrIFSMLae4YQbUTYHbOS2y
         wu7ymUk2C8MKhUhbphTz9kKZJnTVAbm2IE+0IBFm4MFwdw3im9wCywOG3D3hg5+4NaA8
         Ei+Q/5n4Dho8kEQG7Y2V/OWcneNyNnkvZ6u3yp6nWLT8y9GvIU8qC62xwdEFUHz6gvE4
         cFB53r8qy5c6F6sKL+6xpDWywKYImJh7qs0uR5jwbdtdPp546Jk+sM2iXmnbIHvJ71Y6
         n2WQ==
X-Gm-Message-State: AOAM532jGuCWo1K3EF++XVpmcbEjtWdBhbMlBU14bzWIvA6FM9E3pCQ7
        QGed8zwiPLiPYooxdTMIGfvk6Q==
X-Google-Smtp-Source: ABdhPJxI9F4kUMfFp6wDmThTzTexYwb0MQbi2g9FnYzIaCxAj0tdzNLUsGozYSfCaH2+Xwisb7r3Tg==
X-Received: by 2002:aca:1818:: with SMTP id h24mr7425260oih.44.1615482291102;
        Thu, 11 Mar 2021 09:04:51 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e2sm747632oti.8.2021.03.11.09.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 09:04:50 -0800 (PST)
Date:   Thu, 11 Mar 2021 11:04:48 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, linux-rtc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH 3/3] dt-bindings: mfd: Add compatible for pmk8350 rtc
Message-ID: <YEpNsNqcyE+oj6OR@builder.lan>
References: <1615447798-6959-1-git-send-email-skakit@codeaurora.org>
 <1615447798-6959-4-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615447798-6959-4-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu 11 Mar 01:29 CST 2021, satya priya wrote:

> Add compatible string for pmk8350 rtc support.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>


If you add this before doing the yaml binding migration it might be
possible for the maintainer to merge the functional additions while
we're still trying to figure out the yaml...

Regards,
Bjorn

> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> index b4892f1..676decc 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> @@ -53,6 +53,7 @@ patternProperties:
>            - qcom,pm8921-rtc
>            - qcom,pm8941-rtc
>            - qcom,pm8018-rtc
> +          - qcom,pmk8350-rtc
>  
>        reg:
>          description: Specifies the base address of the RTC registers
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 

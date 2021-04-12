Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23BD135D022
	for <lists+linux-rtc@lfdr.de>; Mon, 12 Apr 2021 20:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235229AbhDLSUq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 12 Apr 2021 14:20:46 -0400
Received: from mail-oi1-f170.google.com ([209.85.167.170]:37597 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbhDLSUq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 12 Apr 2021 14:20:46 -0400
Received: by mail-oi1-f170.google.com with SMTP id k25so14369282oic.4;
        Mon, 12 Apr 2021 11:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6uLNKPxr+qrvlGgnAKQt6OBpE5mCSCXT29ad0jlzs/I=;
        b=Ek5rc4z9Mnxr4tXYMGLYsvU/T2akNTlKmIABb2uP2Caz0j/OZAMdBwqkU77uEv9BEs
         qRpZ1euVxrlZ2n47md5tRgHEe27RDU0Anhnni/fz7kYzHPGhdLdiu4ChqUc8MrVjUkC+
         k/kPkl2QAQdUUcR6lcUTzxBc0EEsBeJLBCoDamcIz6Gqw2WDBur+ybUlCtI6XLN0dHIA
         zqmrXy0g6Qr11axo8XMw9p9JQREptlPzXYnb1TniRMZNVVIZwi3qeulP009PDyrX2Tln
         oLiCs4o0VGpJOaYVGQsqXEMQ5w8VJHM4meNFgT3X+Rm41aIBXNLmsBL1bMwzI8CYIn7l
         ynpA==
X-Gm-Message-State: AOAM530UnFhC5HFXfww7R8qK7s4rXzXhSk103q5otbdkcCIAXFoK7dkm
        hlGrAaLJnea6zwQ2wr1oGA==
X-Google-Smtp-Source: ABdhPJw1691Qm55M+EfRhxZ7ocVtczBXE8iOSmUz8jmgvoBIHsfQKyr1gwOZpJPF29CLzmQuTxX9MA==
X-Received: by 2002:aca:4e56:: with SMTP id c83mr343567oib.166.1618251627588;
        Mon, 12 Apr 2021 11:20:27 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z24sm2890415otp.44.2021.04.12.11.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 11:20:26 -0700 (PDT)
Received: (nullmailer pid 4148860 invoked by uid 1000);
        Mon, 12 Apr 2021 18:20:26 -0000
Date:   Mon, 12 Apr 2021 13:20:26 -0500
From:   Rob Herring <robh@kernel.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>, kgunda@codeaurora.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V2 2/4] dt-bindings: mfd: Add compatible for pmk8350 rtc
Message-ID: <20210412182026.GA4148391@robh.at.kernel.org>
References: <1617976766-7852-1-git-send-email-skakit@codeaurora.org>
 <1617976766-7852-3-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617976766-7852-3-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 09 Apr 2021 19:29:24 +0530, satya priya wrote:
> Add compatible string for pmk8350 rtc support.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> Changes in V2:
>  - Moved this patch before conversion patches.
> 
>  Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D00131900FF
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Mar 2020 23:14:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbgCWWOO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 Mar 2020 18:14:14 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:36445 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgCWWOO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 23 Mar 2020 18:14:14 -0400
Received: by mail-il1-f193.google.com with SMTP id h3so14948113ils.3;
        Mon, 23 Mar 2020 15:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YwDVmx/7pr36/zBUwTKAawrGVSeIBJncPSwg7RtZXaI=;
        b=Ck2Blp+HDFleRsp3E1gSqZ3Up8yJWRB1b6U/4AF3CxyG3fozXzhKln1Q48TlEZAmc1
         HLVDxCe1O+yZH+1tu5K3JAZV/YF9k/ZwubsqO79CXoQLmRdyAQ8ZEvTEP61PbzJXithp
         MeWJeBbAx3E1Q+dc5aSkJzVufwS04FWJ5vL1jSUnk3lmj3Y7RvvdXB2KS28E3AcOVpeN
         f5bqXClZUBPPw6K7U0kJl+CIIi/3Zl/DwW4lhI22oM7/SFRd/C/pvnDbV1ie1+YJaCwa
         fNu3tI8kwEAALUiJ9byGzoooQkwCkNI6wJhUfw9k2GWHjh9T8XCoulzyfvZVox0z0Cl9
         gQeQ==
X-Gm-Message-State: ANhLgQ3RKNjMecA2TjzJHfsEg4o1Rf6udk7UgOQDc0vhYEQ5wWWXxzLB
        Se6dIHQoK7097lvGRD/LuT1c0lA=
X-Google-Smtp-Source: ADFU+vtmB9+BQuIncmj63KKHCHqFICX0S67XCzAYHEXUebAJ+2wdsOgqdZHyMJFrPNYNL3B2XPdGkg==
X-Received: by 2002:a92:9a4d:: with SMTP id t74mr14100809ili.168.1585001652864;
        Mon, 23 Mar 2020 15:14:12 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id h12sm4651950iob.22.2020.03.23.15.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 15:14:12 -0700 (PDT)
Received: (nullmailer pid 315 invoked by uid 1000);
        Mon, 23 Mar 2020 22:14:10 -0000
Date:   Mon, 23 Mar 2020 16:14:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>, od@zcrc.me,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 3/3] dt-bindings: rtc: Convert and update jz4740-rtc
 doc to YAML
Message-ID: <20200323221410.GA32740@bogus>
References: <20200311182318.22154-1-paul@crapouillou.net>
 <20200311182318.22154-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311182318.22154-3-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 11 Mar 2020 19:23:18 +0100, Paul Cercueil wrote:
> Convert the jz4740-rtc doc to YAML, and update it to reflect the new
> changes in the driver:
> - More compatible strings are specified, with fallbacks if needed,
> - The vendor-specific properties are now properly prefixed with the
>   'ingenic,' prefix.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../bindings/rtc/ingenic,jz4740-rtc.txt       | 37 ---------
>  .../devicetree/bindings/rtc/ingenic,rtc.yaml  | 83 +++++++++++++++++++
>  2 files changed, 83 insertions(+), 37 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

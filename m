Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34284A5324
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Sep 2019 11:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730844AbfIBJnS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 2 Sep 2019 05:43:18 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:34930 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729725AbfIBJnS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 2 Sep 2019 05:43:18 -0400
Received: by mail-wm1-f65.google.com with SMTP id n10so3183150wmj.0
        for <linux-rtc@vger.kernel.org>; Mon, 02 Sep 2019 02:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=4d0l7N35iWoMyBbjAl4hMooElMfpWLjU+xP3/QM48gE=;
        b=mhtkERu8jUQkzHnNqRbpGC8pMP8PM9wc9YYdW3YJzfxC+5CivPw0eN4Mx0FCBqkZ1k
         MMpoWhfUGlcZ11BMUqW6LIGUqZ5vgXx8aarqN0fXE9js6Z524xGTXLKm6blIp1daoMKx
         0J5VxGMjhAiQxIeU+zuC6dUZUtFUveEcznHTq14si0umE8rRYGiDKfwK+5RFTa/d29GI
         /c/EdZUuoNeHEdVdE8Wk+3yh73Qi+0Ro5yqJlSh32RqsCQGOvjbi8PUiqBo7yQt4iXzn
         6FzeKLgh7cF2NZ50ISsMteEICGPzKmU/mdoKRiwjs/fdB+p7i+EJT9EKTZ0LTnRwsHd+
         Es7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=4d0l7N35iWoMyBbjAl4hMooElMfpWLjU+xP3/QM48gE=;
        b=GbuifzuOxHGSls923tGirRK37cYws6R+p6wQPH+SI1R86Lc+fDxMn12htx+V4ehpvr
         SCIB9/i32ozVZrpUSJG7SQGC5bIw1CkC6jRRsuN+EXTaR4OTUVg84vuXmDGOvvmT3Ner
         skOHvCL1ju2lwV7nJr84X7q5btKiG2iek2DmBca7uleXyXdYGBR6pZAgNJnHywpgtDK6
         ndBsKr2xyN1DeoXBCTDbLkzNZhXbMjkwvUlt1u7B6ZOModmP9sgL3pzpyJl2B1e5hUz6
         hnTyJ/tEynmzx0vgGRNWxwznnNO2VATsOstGCSuYOpYxrOsfKiEUB2zMjt8lXWkWzNb+
         TpLQ==
X-Gm-Message-State: APjAAAWNW9Z77ojXKrmix6MA7PFS4eWiKg65+fxSrOkXGHmUfL+vMw0u
        2NuO1uUQsTt7NlVaqXQ8VzveRg==
X-Google-Smtp-Source: APXvYqzm2jMdu+QtRADNIC1TnhWQKqVD1sQ/ZS7+PqSLNP6Rmxvz386etPsBfvjnR60QuMOGSfWyEg==
X-Received: by 2002:a7b:c935:: with SMTP id h21mr33247098wml.35.1567417396069;
        Mon, 02 Sep 2019 02:43:16 -0700 (PDT)
Received: from dell ([95.147.198.93])
        by smtp.gmail.com with ESMTPSA id e4sm11403837wro.21.2019.09.02.02.43.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2019 02:43:15 -0700 (PDT)
Date:   Mon, 2 Sep 2019 10:43:13 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Frank Wunderlich <frank-w@public-files.de>
Cc:     linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        "linux-arm-kernel @ lists . infradead . org Alessandro Zummo" 
        <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Josef Friedl <josef.friedl@speed.at>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Sebastian Reichel <sre@kernel.org>,
        Tianping Fang <tianping.fang@mediatek.com>
Subject: Re: [PATCH v6 01/13] dt-bindings: mfd: mediatek: mt6397: change to
 relative paths
Message-ID: <20190902094313.GP32232@dell>
References: <20190818135611.7776-1-frank-w@public-files.de>
 <20190818135611.7776-2-frank-w@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190818135611.7776-2-frank-w@public-files.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, 18 Aug 2019, Frank Wunderlich wrote:

> paths in dt-bindings should be relative as suggested by Lee Johnes
> 
> Suggested-By: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> changes since v5: splitted from dt-bindings: add powercontroller
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

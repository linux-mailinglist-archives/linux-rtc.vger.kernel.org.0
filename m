Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0EE4303316
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Jan 2021 05:46:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbhAZEpw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 25 Jan 2021 23:45:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729093AbhAYOAl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 25 Jan 2021 09:00:41 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5583AC06178C
        for <linux-rtc@vger.kernel.org>; Mon, 25 Jan 2021 05:57:30 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id m1so11931643wrq.12
        for <linux-rtc@vger.kernel.org>; Mon, 25 Jan 2021 05:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=q2EuLggpk9Unx5U8zIux4+e58o6cdVDWEpWfZQyk+cU=;
        b=tAMuTqLJ+95+XHZSZNNAs3tqEpBxE08VBSO9Iy7DEuslp07YxsmH+VK2kw0wDq1E6o
         IzhOQAOg7ysdD+uMEhSGQYKWTZ1E6C+mUWlLDCNx1yAW9/pdBwL4HG5YAGzp434/CWHP
         j3qvZ8z41b9F2F8arlWs0ikPqzFwMrcuplvXXjI0l4Z74dCMecRRNNOrM1B4R2x2pPX4
         agFzYQI4AJ6GnV9iBEj+ShFnmDXLjYo14oDNW3wFw/L2gL1+EYxQxbpvH+9Gh4p4LTfP
         IzHS7sBlCShTBNpnHOus5NpJIndkKI1I4OI7SdMH/IQAQPXgB1QtJkhGsfpfCvACdSeN
         WApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=q2EuLggpk9Unx5U8zIux4+e58o6cdVDWEpWfZQyk+cU=;
        b=qVBkE/o2PfR72zBa7mCQAHrgUn1rQ3Y5LgP9E7ciVmdTn2wrDTZ0hO4SBtwBCxZQ1U
         KVcBcvVi/FTPW/haN2vPdSVpxf6xyqj3A5J58A1/WPKDaFRKDSQESNKuD/dWuyTQzFJg
         NFuTo/ibASjiDBTGXndNM5xS5mVWlYJb6b5pcwMCYqQKBc3VxN5d+fWxAhi/1MCbG4uJ
         UKiYe2oftcZR5Oqjs4mTywYZg3837n+f4CrrOBm8AlKhIYmKxE6tvZ1JZj3EZulP4Nbe
         a4CkXa3iGi2IOiMvw/sSrchwQpb/YcNuAlUIsWFR0pyjbu2D0vPQf64b/knReUO5eMtg
         NOVg==
X-Gm-Message-State: AOAM533DV3WpoOZDQV+iEk8IiOOlok3cP5vgy+9sg8IOBm5weDrAdbkT
        BKTV/ZaNp/mKuIfd3EqF7cv6wA==
X-Google-Smtp-Source: ABdhPJz9GQRNLQm6uMRfQ/m9HgSJ+ruVCBBpzryC2+JmyRk/X0AyMpK3eE6QLs7zauQV44Q43tBXvQ==
X-Received: by 2002:adf:f1c3:: with SMTP id z3mr1129849wro.96.1611583048991;
        Mon, 25 Jan 2021 05:57:28 -0800 (PST)
Received: from dell ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id n11sm25921264wra.9.2021.01.25.05.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 05:57:28 -0800 (PST)
Date:   Mon, 25 Jan 2021 13:57:26 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 08/17] mfd: Add ROHM BD71815 ID
Message-ID: <20210125135726.GY4903@dell>
References: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
 <001e0b5da0d68366b6d61b810468646fc8e07153.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <001e0b5da0d68366b6d61b810468646fc8e07153.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 19 Jan 2021, Matti Vaittinen wrote:

> Add chip ID for ROHM BD71815 and PMIC so that drivers can identify
> this IC.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> No changes since v1.
> 
>  include/linux/mfd/rohm-generic.h | 1 +
>  1 file changed, 1 insertion(+)

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

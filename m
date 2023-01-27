Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61C7167E7E3
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Jan 2023 15:14:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbjA0ONl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 27 Jan 2023 09:13:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233756AbjA0ON0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 27 Jan 2023 09:13:26 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD6437CCBF
        for <linux-rtc@vger.kernel.org>; Fri, 27 Jan 2023 06:13:24 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id bk16so5072737wrb.11
        for <linux-rtc@vger.kernel.org>; Fri, 27 Jan 2023 06:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mVctv5eDwfoxIjLhTETlJMvtbUx+PQOv7ZLAfMpykYo=;
        b=efpKEqP+zZNsaIrRViELne5gnS27yO4dinEoccIQGZDp7CB9wAAYGNoJYhEzdy/CcV
         VjKgx4YcMwPw+lh95dN6W6o4wjRmrC0M7Yams/GWGTfI7g9EhcHMuBWHm3u+rJvGdq1U
         zRAEht79DkiluZHuD9NAKIxUSLvBe65z9txT7DZLTn/El+9B2ndW/fGOgoP7vdmiMEL8
         Z/QdKAlM7AWY3Wy7ALnjauUp8EUM0JegUkwS89B1hpGoMMGyWZz+QQQglJ99CL1JW5RU
         VfwJUCX56lL4bMKfiOWr5/gGzf6c/NvtE58142cN6+eZfMeiO3u51BRNxiONi9voTLMs
         r0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mVctv5eDwfoxIjLhTETlJMvtbUx+PQOv7ZLAfMpykYo=;
        b=RszGsRTMvbtwqAt3KC7g1gGe2YEDlY+zKfB3dvc9ybWZYCuqaT9ObBNyOChNwuHBuY
         HPvqXha9wJlUNu/lA1Lree5oRQmbxUYv8zjHDrTOKesaRXLq1HqRTWWAnPpJtcXr/jhB
         aRQuvkIDNS3CCOVZIGBEBEPzCscx7pCTvcrbARM/F6/xZHWwmbNdq35fFioedNyXbgZn
         +8CJ80tHdDgh6czDqwHrHRhV8p1z7/tCX01urOv1r5yymhFGAX9qEtHnm6bHki8+69LK
         zF1QIUa8pvaDbrJsLzZEb07aZpdJwp0WVZceboNXez6u79dewkaeLaSA4SOoE4DTjYW8
         ddrA==
X-Gm-Message-State: AO0yUKU1Bkwl/DCePH4SqdrB/q+O7kDXDRz1q0dwc5L4whkj92RaBfkE
        z0EuYSLbi27LHAFphEpoVUoB9w==
X-Google-Smtp-Source: AK7set8wCkVuAc7TPOvZ2ORkiCGPcKdWseqtrdWE6YkOgeblgrpB1xcuodXvJ9Y4ooNTTu04lXygjg==
X-Received: by 2002:adf:e842:0:b0:2bf:c58b:9cba with SMTP id d2-20020adfe842000000b002bfc58b9cbamr6185515wrn.60.1674828803425;
        Fri, 27 Jan 2023 06:13:23 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id f1-20020a7bc8c1000000b003c6bbe910fdsm9297442wml.9.2023.01.27.06.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 06:13:22 -0800 (PST)
Message-ID: <85481368-b32e-61aa-f83a-fb42d58c351a@linaro.org>
Date:   Fri, 27 Jan 2023 14:13:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 16/24] rtc: pm8xxx: add support for nvmem offset
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230126142057.25715-1-johan+linaro@kernel.org>
 <20230126142057.25715-17-johan+linaro@kernel.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230126142057.25715-17-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On 26/01/2023 14:20, Johan Hovold wrote:
> On many Qualcomm platforms the PMIC RTC control and time registers are
> read-only so that the RTC time can not be updated. Instead an offset
> needs be stored in some machine-specific non-volatile memory, which the
> driver can take into account.
> 
> Add support for storing a 32-bit offset from the Epoch in an nvmem cell
> so that the RTC time can be set on such platforms.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/rtc/rtc-pm8xxx.c | 134 +++++++++++++++++++++++++++++++++++----
>   1 file changed, 123 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
> index 922aef0f0241..09816b9f6282 100644
> --- a/drivers/rtc/rtc-pm8xxx.c
> +++ b/drivers/rtc/rtc-pm8xxx.c
> @@ -3,6 +3,7 @@
>    */
> +static int pm8xxx_rtc_read_nvmem_offset(struct pm8xxx_rtc *rtc_dd)
> +{
> +	size_t len;
> +	void *buf;
> +	int rc;
> +
> +	buf = nvmem_cell_read(rtc_dd->nvmem_cell, &len);
> +	if (IS_ERR(buf)) {
> +		rc = PTR_ERR(buf);
> +		dev_err(rtc_dd->dev, "failed to read nvmem offset: %d\n", rc);
> +		return rc;
> +	}
> +
> +	if (len != sizeof(u32)) {
> +		dev_err(rtc_dd->dev, "unexpected nvmem cell size %zu\n", len);
> +		kfree(buf);
> +		return -EINVAL;
> +	}
how about us nvmem_cell_read_u32()

> +
> +	rtc_dd->offset = get_unaligned_le32(buf);
> +
> +	kfree(buf);
> +
> +	return 0;
> +}
> +

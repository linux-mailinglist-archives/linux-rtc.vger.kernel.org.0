Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B35B776279
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Aug 2023 16:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233317AbjHIO3j (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 9 Aug 2023 10:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233302AbjHIO3j (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 9 Aug 2023 10:29:39 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 999C91FD7
        for <linux-rtc@vger.kernel.org>; Wed,  9 Aug 2023 07:29:38 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fe5c0e57d2so27376545e9.0
        for <linux-rtc@vger.kernel.org>; Wed, 09 Aug 2023 07:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691591377; x=1692196177;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MNnJWt3Ml/e+CS6gb7T+DN3KuuP7RKuupkwVkLHrzVg=;
        b=IunFX9+mWaUKoG9jeAXOfPCHo25r5SrUF/iqYKMmj28P0SoMMQPPlOxT5tyXIV5Guh
         GNZECi3lLcwR8CcpfFE13EmQtbDip8bP6QcLPB9imA/DXNB0wvacylNp3oTVlPY5cf+4
         qNRek2RHoRPFQ6LlDGv/O2bC0x+Sx8ZBpe7HazRCRdMjmGX80Myner9C0xll12eaaq3v
         MaCZVBJVSN8De6D3Pea8OayoRkB56hm8jNXN5XUQ0FJvtYhaAt1HosFR0uozZm2huk9x
         9DSkMG6SqWdDyhKziOfFghhS+RfoJb4024dwi+OOnVaZooqcBVVjUT7aAbuAOt2fpFHI
         2Tbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691591377; x=1692196177;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MNnJWt3Ml/e+CS6gb7T+DN3KuuP7RKuupkwVkLHrzVg=;
        b=WxUkiLmZ5Us2TIfFweBAANjcFta/l6JA1XNMNPpUVaXdc1v1qYGsYqfBYB8pxvZwfa
         qG6vE1vuCqOVLiw8rCH1lnz2l4qvI7TIKFmEA+rlRiwrnit2yB5BTJDNT3kpbyjL7DDD
         /Z6gAlfKZtOCrEqhSIRiTBR7bjUjjx6Dx1hsv3OcZbsoP954JzW6AvWt+p15pT/K8PFv
         W8y2sSJm5xLgrp6mgiay3d9fpXkQf8DptqwOViwLU8Msp4/1EmkoPhpOXikYOfzqLGw/
         1ivFtmYsatx6h/4B0qZp3kP7y8d59tF4DTx1rU/4V3gPHa4W2K4PzfjhRmmqlVACyB3U
         F/6w==
X-Gm-Message-State: AOJu0Yym56xcSmHtb5ipwkFcvIgyJZ1R2nbFi/wTeLVcd7fUwxiG5tXP
        Ky/iXx8P/rE1BY1g+HU8+vspXw==
X-Google-Smtp-Source: AGHT+IE+CisNQcAXzJaQITtm7nC1+71FXGVcEiFr3F3ZRxLtNN5kjYxDbxGZYJdIeWGAhLr41pFwCA==
X-Received: by 2002:a05:600c:143:b0:3fe:1dad:540f with SMTP id w3-20020a05600c014300b003fe1dad540fmr2227915wmm.10.1691591376468;
        Wed, 09 Aug 2023 07:29:36 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id 14-20020a05600c22ce00b003fba2734f1esm2182688wmg.1.2023.08.09.07.29.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 07:29:35 -0700 (PDT)
Message-ID: <50bedd75-bcd6-d7bc-26c0-b8c00f99779a@linaro.org>
Date:   Wed, 9 Aug 2023 16:29:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 2/2] rtc: nuvoton: Compatible with NCT3015Y-R and
 NCT3018Y-R
Content-Language: en-US
To:     Mia Lin <mimi05633@gmail.com>, avifishman70@gmail.com,
        tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        KWLIU@nuvoton.com, JJLIU0@nuvoton.com, KFLIN@nuvoton.com,
        mylin1@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230809095112.2836-1-mimi05633@gmail.com>
 <20230809095112.2836-3-mimi05633@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230809095112.2836-3-mimi05633@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 09/08/2023 11:51, Mia Lin wrote:
> -	flags = NCT3018Y_BIT_TWO;
> -	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
> -	if (err < 0) {
> -		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n");
> -		return err;
> +	flags = i2c_smbus_read_byte_data(client, NCT3018Y_REG_PART);
> +	if (flags < 0) {
> +		dev_dbg(&client->dev, "%s: read error\n", __func__);
> +		return flags;
> +	} else if (flags & NCT3018Y_REG_PART_NCT3018Y) {
> +		if (!(flags & data->part_number))
> +			dev_warn(&client->dev, "%s: part_num=0x%x but NCT3018Y_REG_PART=0x%x\n",
> +				 __func__, data->part_number, flags);
> +		flags = NCT3018Y_BIT_HF;
> +		err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
> +		if (err < 0) {
> +			dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n");
> +			return err;
> +		}
> +	} else if (flags & NCT3018Y_REG_PART_NCT3015Y) {
> +		if (!(flags & data->part_number))
> +			dev_warn(&client->dev, "%s: part_num=0x%x but NCT3018Y_REG_PART=0x%x\n",
> +				 __func__, data->part_number, flags);

I don't think this is correct. Kernel's job is not to verify the DT...
and why would it verify the device based on DT? You have here device
detection so use it directly without this dance of comparing with
compatible/match data.

Best regards,
Krzysztof


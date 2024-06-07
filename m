Return-Path: <linux-rtc+bounces-1268-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC725900941
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Jun 2024 17:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F744B20389
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Jun 2024 15:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E304A198A24;
	Fri,  7 Jun 2024 15:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="juK0y2aV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F531CD37
	for <linux-rtc@vger.kernel.org>; Fri,  7 Jun 2024 15:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717774620; cv=none; b=LeNoWgOl94Y0Rzarmcx/92glD7IY9AFJgQ2zKOFkAmRENG8p+Zf0TXtedug9YSCQtZQWcJ52chZquTryUpnhPpQx/rsbnNUDhLtMFa3mV2tdfATya0Gae9/3Qr8B37xSj1XZ4nnNwU4vIZN8s39UITlvLqiZDU4S205XVNb7Jbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717774620; c=relaxed/simple;
	bh=njFwS84yyP3Xwr02JnamX7Dhu6AzJdZO+TJ88+ClOI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wp7CyNpwBrqGbJOarxoliUG8MZxXqSpg2h655/4kHfcl1hx+CRhaMh48QGWnkgBUUBlPUUWHCLpW16nmkhIBSRoly/CI5Tw1jLXr+aD2Bu5sFro7lHXASFxocdvwgZ6A1W0a+bDIFHjaFTfbIOrYSB+0hadwxYjtQubCSDMGQ6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=juK0y2aV; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42121d27861so21297395e9.0
        for <linux-rtc@vger.kernel.org>; Fri, 07 Jun 2024 08:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717774617; x=1718379417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4WFHGyOf2WCg/AHCXQoRe0OOLDlNcvfZjAFHn1msRSw=;
        b=juK0y2aV4TYboAh8nEXjMFk5fN3uC3FwvkzbSNZxHs6DWC3/Q+8c7UQRkyGOGg0GbQ
         1DN58wUt79ajkREwHVoLA4TCG38OF5JSoywS9PmoYSjra8jY1jLLFq5MCIuxJYnpgZPX
         6lTfweu+Crph9x5sCOcF+AwY4TgZFdyzgT7Mp3JEmbseYqmNz9HURCFLyVYhZ9FGdCbm
         6ISPzY+0I2OfOHfXuOTmn0dGWCDcp+DaKcZR6jxWYDugYn1epGEbvCW1mkz8XJiIcYpH
         u0ZE7wPmp/bTjc6xjt1S9dhsXb2/OFfG27ReP+LcejxTkFg0TA0x2EhDrVgnSTj+KuGo
         Hl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717774617; x=1718379417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4WFHGyOf2WCg/AHCXQoRe0OOLDlNcvfZjAFHn1msRSw=;
        b=RmyiWV0j2TAZXtwQSkgxbTSGXXPOG9jG4G6+Iez3KkC2k8YCkWPg5jlpo53kjQYA0E
         hmmhtLYo2NqD0jhBMfBIlQ2j2ZFMQiDh5napk+qpWHrrTWxyTsOEupJMC9XGi4d6ARSv
         oRmSuK4helFwgNpLku0saehawx43jzN6KoPzqC/vTfz5QSkERd+chr7GxrAZr3ZKExGa
         /Zs5fJyjh32CGIFbHH5Uuwq9fcP2HLrOaZ71jOTnm7zNZOMVz18ArtRPF13Num0SfLqi
         z/8qA7hpBJBWhoJ+I9aSC6kJTpQAL40yvthFm7yByNTSLYo7kPR9axHPigcWP8NTllfO
         3/Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXUbCnluyWppHITojSLd4yaYh4dRRbyWayWs7WCpWHwueXiFsJ0n7SiED1puBy7V0BKZ7HUTf8PetqnGBwaHWqcma3Za6Pa8CC2
X-Gm-Message-State: AOJu0YzngSd0rAJhbyMty2OzXhsFpsHRT3+VqTmIToGdQFPd0rvVOpbO
	tPwvaRvFTsYs70g/Pt4/tthtnmCMCbsqIslD/YKtU890GAPeZJtXDwlZtgELUQI=
X-Google-Smtp-Source: AGHT+IEDldfKJ9oi/vJP0wgtmawveExjpCYHaZ1+MQjCvlUC+KOjWN7/r5DIQyvHKU1HK5ctc+JgNw==
X-Received: by 2002:a05:600c:444b:b0:420:29a8:ff5e with SMTP id 5b1f17b1804b1-42164a0c1c9mr25925175e9.19.1717774617356;
        Fri, 07 Jun 2024 08:36:57 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4215f89aacfsm48862905e9.42.2024.06.07.08.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 08:36:56 -0700 (PDT)
Message-ID: <7cc32596-8af0-43ff-91fd-59264d0a29ac@linaro.org>
Date: Fri, 7 Jun 2024 16:36:55 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/17] misc: eeprom: at25: Change nvmem reg_read/write
 return type
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Joy Chakraborty <joychakr@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-usb@vger.kernel.org, manugautam@google.com
References: <20240605175953.2613260-1-joychakr@google.com>
 <20240605175953.2613260-8-joychakr@google.com>
 <f98a1d8f-e936-4798-8447-c642e8fe11d5@moroto.mountain>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <f98a1d8f-e936-4798-8447-c642e8fe11d5@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/06/2024 09:41, Dan Carpenter wrote:
> So the original bug was that rmem_read() is returning positive values
> on success instead of zero[1].  That started a discussion about partial
> reads which resulted in changing the API to support partial reads[2].
> That patchset broke the build.  This patchset is trying to fix the
> build breakage.
> 
> [1]https://lore.kernel.org/all/20240206042408.224138-1-joychakr@google.com/
> [2]https://lore.kernel.org/all/20240510082929.3792559-2-joychakr@google.com/
> 
> The bug in rmem_read() is still not fixed.  That needs to be fixed as
> a stand alone patch.  We can discuss re-writing the API separately.
I agree with Dan, Lets fix the rmem_read and start working on the API 
rework in parallel.

Am happy to pick the [1].


--srini


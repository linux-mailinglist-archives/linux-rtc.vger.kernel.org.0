Return-Path: <linux-rtc+bounces-1252-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE0A8FD589
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Jun 2024 20:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8C2BB299BE
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Jun 2024 18:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A82913AD3A;
	Wed,  5 Jun 2024 18:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="StPsqxqh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8D813A87A
	for <linux-rtc@vger.kernel.org>; Wed,  5 Jun 2024 18:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717611132; cv=none; b=pWCbAvQAlVD2x4WpH5tONovNX4GXYWmVrqS0+VrGGeKDi/l3OCY9wpflJyJ5PPlcwHYPWXk7msx+PtQJHlyhCHCKNK7X3MJxUMEz4jtJVzsCU1fP6hsrlLPdwfyoACZcY/7p+hCI68k3KOHJ8QDQhVZZu6DqNNgOGfhTDYtTMwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717611132; c=relaxed/simple;
	bh=z9OkqguqeJwlzfT4o/NLntU6DYYfOLDylgpwXRTP5l0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Znb6tokgcjM/SDk6GxTXqhQCDP2QyoIjgSdt1Cwea/4FPizTWl0kNxJ234dlj+tzyqidwDH4HYFLxmXIBivq7YUqnr63DsfTF/eH1/2Xr6ggpgjv4V0yF5ckGV+dDSlJc8qgDICsEzLXMxQ7/cxJ7btCiwXkAt+ekFZ30zkDD6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=StPsqxqh; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42155143cb0so1736805e9.2
        for <linux-rtc@vger.kernel.org>; Wed, 05 Jun 2024 11:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717611128; x=1718215928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z9OkqguqeJwlzfT4o/NLntU6DYYfOLDylgpwXRTP5l0=;
        b=StPsqxqh1CxQ9wqgQg1u5dUOhRs2nnMAQSLON0oZJoIGdTTe3gHEzHdZt5m/paNn3Z
         S7O01aRIraCjOJpt0PcvLOLZNG1egk2wJBRGDTwAkPhBPYu1BLZomG+uvop7+evSU8Zm
         AVijTvOwxorlyfUnZPsHgGygByuyrmJ3Sux3cG2fTLvN+c9DZMQoLmt1Tf+Mbr1FKzTd
         5KL/0Q814gIMcJfbd00XY31+FoNGhl63xiLCD82ijQklw+4ukMjLMePkd+ZEu8U5qBi7
         VYimq5WWzyDHGt80k+DwO16oxN9YGsL/ojtP7gJnD2VgSSCMi4hppzuY1fWrcWGDbPTc
         UhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717611128; x=1718215928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z9OkqguqeJwlzfT4o/NLntU6DYYfOLDylgpwXRTP5l0=;
        b=H1FyprvRh/PgtTyqv1Pca6DICI1TkQNgYjqKuDDnNwrCqPCTVZU/4mZ1qsPvQ1DIKf
         Xh4MLhlEw9k8z2m/09pOS1UrZCvO+tsnicHnhDmnmNzD97pFw6moPgrFpqvp3V3arZAS
         GzjEWN+hW+7Bb525eY8XVascP8dtb6hIG1nhKqRIHeSTggKq0wOjR34AsRrlWmNk1nh3
         PaOP0oa2iKOLihCFPRDGYkVcaic9jomF/I/sLjh6K5e41Q2DATqZHVnj5zx/fDWT6qvI
         cmQSc9+/RniiUW+B8gagUB43fvDHcXkk3TfwwjfweNoz+jA4+Br1sCCdGm2xPJUTH9Jm
         mWfA==
X-Forwarded-Encrypted: i=1; AJvYcCXKw5q1ojYWCfB4fPSEZdCy4BAH/lk45Ir9688SH6o26CUVy8AloTm0YKKu4EC3GdnDz9TYezqLQKhY2VJ9Np0IHIc3RkB52iol
X-Gm-Message-State: AOJu0Yz55HJ8B5elvLu+tjLDMmYxBI1WjP+y7iQbcnTpCtKd90cdboJm
	KkdHF3cXEosvjzz5n2263lBfA6GW9v6ZC/Q84wo17ohTytldG37g85JN8SBtAw4=
X-Google-Smtp-Source: AGHT+IEvaA8Q5QYjqCVUDlFHwF6aq9tSqiBZFVHoOS8pIX0aZ0OJo7FFt2ruymdqoNfkRUE1c/CDUw==
X-Received: by 2002:a05:600c:4e92:b0:421:29cd:5c95 with SMTP id 5b1f17b1804b1-421562ccd31mr34249765e9.10.1717611128459;
        Wed, 05 Jun 2024 11:12:08 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-35dd04d9c68sm15224191f8f.56.2024.06.05.11.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 11:12:07 -0700 (PDT)
Message-ID: <d7cfe53e-533a-4c39-b4d8-cdbee3617294@linaro.org>
Date: Wed, 5 Jun 2024 19:12:06 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/17] nvmem: Handle change of return type in
 reg_read/write() definition
To: Joy Chakraborty <joychakr@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-usb@vger.kernel.org, manugautam@google.com
References: <20240605175953.2613260-1-joychakr@google.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/06/2024 18:59, Joy Chakraborty wrote:
> Currently the nvmem core change is picked on
> https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git/log/?h=for-next
This patch is reverted due to next build failures.

Please resend the series with this included.


--srini


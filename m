Return-Path: <linux-rtc+bounces-970-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A51689B746
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Apr 2024 07:55:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 914E11F21586
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Apr 2024 05:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F4B79F0;
	Mon,  8 Apr 2024 05:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tvRVasim"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA6C79D2
	for <linux-rtc@vger.kernel.org>; Mon,  8 Apr 2024 05:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712555714; cv=none; b=MRZPCxT1l3+b+ZKY16cAnVNA8Y5ZyT6yak86/99R8xs0AzOWHchMKmp/D4zMfoqMXW4XSrpfDNgF9vqtV4lqJs89BUyuV4oZdY8lKV2pWwnr4D9AQj3CQby7009aoYTOVSykE8y32wMnxx0yylQ0ocCjfv1MljigfnMr7eKiUgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712555714; c=relaxed/simple;
	bh=jcoIomp/z6kD9KMZlxXtkgrBsId7jYabDWZvbuXZvAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZHtGQAO8E+6s007w+2/+kUc7E7WgkfOk49JOK4C7Y/ZwqRR+T2E1VmAjYlFgtBYI/zfPBwTavJsz+lMiJM30kQQ+ZtT3YxGz4CrYLXhnRrGDYba7hS0SfmUim6YPoKSZgkTxxLPf3zmheSyae+lTHD9VkxKYj8++CBk0jYtzV+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tvRVasim; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56e4a148aecso1103941a12.1
        for <linux-rtc@vger.kernel.org>; Sun, 07 Apr 2024 22:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712555711; x=1713160511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C++ToI958gqnXfhfFAlqE16hWGsT6uqgEY4ZriDanL4=;
        b=tvRVasimfpfPR/dVTz1R6vDQLdaUkXUWqvif+CScR/dP+RhdzJfLtiwIAT7Jy+gUWj
         WJ/OJPsOmzJvXns6vBr6o0tQY0Fvw7ahFaGvByPl1v223QvxFN3BnTeCWEP8TBvjYD+A
         yXuaCoEVcDhWTmpiK1ToW5qU+WoVOZ0F2i2twilnUKkortSE7u+m7/hl6rzPViJT1lyp
         603MJURzuBawThfma5dOuldqB56D+qaAqOv5k/iNkuABkqZduty5KZ9kVZplhiNoNHkV
         skS9f0HQkr/Qe/lndX2QQrqVfdTZj+qv7ApbCU0fmqn7JJxE9wr0C7L6GN40HyN9Ex8j
         t9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712555711; x=1713160511;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C++ToI958gqnXfhfFAlqE16hWGsT6uqgEY4ZriDanL4=;
        b=olHTBbkk6bqhI9A924UqmwvNBkLuF8Xmantq2gM6gekcsgl+VgA39JYykQEK/MuTl2
         EccwCS/zfrtUFcJ55sP4zAT56/Fq6jbMHw4Jx4luSJkzGSDTi9zUBwVzlC1abnB6ro/Q
         yy8l/Yh0R5mRS1bLm3NOwGuRIFl8BBDm/gogyCC+YpUb3qBgSS52P5izE0ppcWsp7E1P
         moyyidRAUcKetV8AK2exg5tkk/PfzZ17bQmDpyrzPaCeYhqsrKXUCV2vdXUgWO1bUCGx
         mK1uhM/JCtYrXLPw9arp7Akwx/TuIpB0lHCtwE5Fzu8z4+nLge5ew/X1ExfSEeoF8uxN
         t94Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8cfg0ZsyGUz16JCrr6plKYawiMJm+JsD6cB8h+BcbapkSv+A3Pifmb1N5el1XlUeA12DWZaomTBGrSMshO5pkm9gQDgws35yJ
X-Gm-Message-State: AOJu0YwWNcq5oBOkLFa+uUfIEtaqjqKyJpaPdc4AfrKJj4hMdgNYxxbO
	nIZITEbLIvFDfZCOOXAlbZ4qeAH89VOBKC39L1KLt4lk7vOXr+tbSgB3+VBz5pg=
X-Google-Smtp-Source: AGHT+IHg5RpKdnO/NhaYi3t3QkFGhwgzVkVzdw/kxI5hQtKos19dkXtEeugqLBmNVOOE08hvO400fA==
X-Received: by 2002:a50:d60f:0:b0:56e:2452:f864 with SMTP id x15-20020a50d60f000000b0056e2452f864mr5799865edi.35.1712555710875;
        Sun, 07 Apr 2024 22:55:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id j23-20020aa7c357000000b0056bf7f92346sm3696581edr.50.2024.04.07.22.55.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Apr 2024 22:55:10 -0700 (PDT)
Message-ID: <3a60c2e8-1eea-4d04-96e7-965db96e8bb6@linaro.org>
Date: Mon, 8 Apr 2024 07:55:08 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] rtc: pcf2127: configurable power management function
To: Markus Burri <markus.burri@mt.com>, linux-kernel@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240408054926.3994-1-markus.burri@mt.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240408054926.3994-1-markus.burri@mt.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/04/2024 07:49, Markus Burri wrote:
> In the PCF2131 power management the battery switch-over function is
> disabled by default.
> After a power cycle the rtc clock is wrong because of that.
> Add a device-tree property to configure the power management function
> and enable battery switch-over.
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> ---
>  .../devicetree/bindings/rtc/nxp,pcf2127.yaml  |  3 +++
>  drivers/rtc/rtc-pcf2127.c                     | 22 +++++++++++++++++++

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run `scripts/checkpatch.pl --strict` and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

>  2 files changed, 25 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> index 2d9fe5a75b06..5ce0ca6dcedc 100644
> --- a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> @@ -30,6 +30,9 @@ properties:
>  
>    reset-source: true
>  
> +  pwrmng-function:
> +    description: Set power management function for PCF2131

It does not look like you tested the bindings, at least after quick
look. Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.



Best regards,
Krzysztof



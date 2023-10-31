Return-Path: <linux-rtc+bounces-155-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0737DCC90
	for <lists+linux-rtc@lfdr.de>; Tue, 31 Oct 2023 13:07:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01FA92817F2
	for <lists+linux-rtc@lfdr.de>; Tue, 31 Oct 2023 12:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 425F81DA3F;
	Tue, 31 Oct 2023 12:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D461D553;
	Tue, 31 Oct 2023 12:07:05 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83F9755A7;
	Tue, 31 Oct 2023 05:06:27 -0700 (PDT)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6d2fedd836fso1053596a34.1;
        Tue, 31 Oct 2023 05:06:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698753986; x=1699358786;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KwJ8AtoBrkBNCnTtlse8Ku4Ug1vP6CiFi0/b92qOz5g=;
        b=qunxUNsDa0ah0eGMIQBYCC32757CZxANjgiTHEpG/EtyW7RiSoyEl6Dk2NmhAMOdED
         n9PVDVm7gho4ZKfLvVpy3unJVBFJ8ekBabrWaLLHF2oSY1cm/VzrW6I4RqVSz8Cr9aE/
         V3Vx0f34EG9WN/Epw3IuS2sUYZVlcvjp3NoO/eqWxxNyQZnyY4x7sslTGfCg9CtBYpz0
         Ndsu4sBnefUMe3GU4s8sJJJGfNGTjdmhdFQM1bN+I8VsroMg3feF9DJuV87/WgWlZrYr
         QswpwdcYJa/iaowV5CsvQDZGMqjfJrWj8P82kY3gNzeW/dQeN6QALilNA+Q3Enrn9mvN
         E9Cw==
X-Gm-Message-State: AOJu0YwxUHU4zYe6VUWX0CKLCkxIUmmQEwS9K5B/HIrN/hdt2ydHDg/Q
	AdX5/ruuodaNCPlT0HJcguHfV+j69g==
X-Google-Smtp-Source: AGHT+IHu8fXiqRuYtkRdrQjQjSqDkRBPAZCalDhDui3HwNZgqx7NW3lHH3Yy/XlMVwIbEf/3VVL7gw==
X-Received: by 2002:a05:6830:7191:b0:6cd:9bc:b994 with SMTP id el17-20020a056830719100b006cd09bcb994mr15651079otb.1.1698753986331;
        Tue, 31 Oct 2023 05:06:26 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b6-20020a9d4786000000b006c65f431799sm196375otf.23.2023.10.31.05.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 05:06:25 -0700 (PDT)
Received: (nullmailer pid 1220257 invoked by uid 1000);
	Tue, 31 Oct 2023 12:06:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Jean Delvare <jdelvare@suse.com>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-rtc@vger.kernel.org
In-Reply-To: <20231030115016.97823-2-antoniu.miclaus@analog.com>
References: <20231030115016.97823-1-antoniu.miclaus@analog.com>
 <20231030115016.97823-2-antoniu.miclaus@analog.com>
Message-Id: <169870508338.2649393.15101906939407889165.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: rtc: max31335: add max31335 bindings
Date: Tue, 31 Oct 2023 07:06:24 -0500


On Mon, 30 Oct 2023 13:50:01 +0200, Antoniu Miclaus wrote:
> Document the Analog Devices MAX31335 device tree bindings.
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---
>  .../devicetree/bindings/rtc/adi,max31335.yaml | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/adi,max31335.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/rtc/adi,max31335.yaml: title: 'Analog Devices MAX31335 RTC Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/rtc/adi,max31335.yaml: trickle-diode-enable: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231030115016.97823-2-antoniu.miclaus@analog.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



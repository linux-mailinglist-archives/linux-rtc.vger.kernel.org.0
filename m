Return-Path: <linux-rtc+bounces-4715-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD5CB2C1FE
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 13:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C6243AAB0C
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 11:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3BF832C326;
	Tue, 19 Aug 2025 11:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYKAGYaf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1D8146585;
	Tue, 19 Aug 2025 11:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755604089; cv=none; b=bCzzs624OV6QqBreUWVs07k1QLLZlLOrfHq/RB3pPTlmVWmlfzn8YTdsEiNiawSv3VLStw8UlI88dtZYJIh6F5XSzvnjE5392v7qIzNEwGK3JFmk02sLrRYRe4ULl9MgrxsS8ZshoMV2SSbzVXiWgIWFfSs6fh39rlZMJ9VFUgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755604089; c=relaxed/simple;
	bh=7ZN9mquuvmQGhl/5cAieHoqLnblhiM9pvWAqAoyRNDU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d0WTaBK6IvoCQzjb1oUUnFNQL6uK81aZahKQty62ADKeR/lYlFfoxwGtlsHHHSey+eNnT4w/mV86QVME8ZNW+m6PJcgGEJYTV8SoROGKLjnM/ZyU1eQQ2cV4z0kIiFaQmr8Xcb+IN9ZiHuewnBW98ugFrZ7u5FIJSsK7rdvDFzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYKAGYaf; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-76e2e89e89fso6697177b3a.1;
        Tue, 19 Aug 2025 04:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755604087; x=1756208887; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FaZa4M6CxbX6pzPM8uUMfQ1ohGFtVIghvpFJuewWws8=;
        b=ZYKAGYafueMTSLq5WZLAkuiZgNTwhhNy/ZWAi+kB9oGwaAOftUW4md4dkEYNAB+2Vu
         nlp1UvUHPBj0+ygb/XiISkugdSJ/He+nI5Cu0W+NETV+iqrBlzG0rY3P4XpfbxCeXTGx
         KXb3MR4gFPAMlMwyqFWan8bw6W5Bv5YMHnwOWGHnO8CgNXfAmUhcWh1IijuNsaCpGL4X
         Qv2bEnQJnIDu+oOm/hokH9aKPRArER5qkwy9kmt0UezbwRJSIAxUQqAPKbjLhxfT/kRB
         hLuz2ZEk4pWh6rTSd4yXK0eiv0bmBlEFpljXTb1RLWOAwBdVKw8I6z9lhfr3lK8lIhZ8
         8m0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604087; x=1756208887;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FaZa4M6CxbX6pzPM8uUMfQ1ohGFtVIghvpFJuewWws8=;
        b=WXPvcuW5i8F3Sln7PjLItCRBcMucaJ7WYd3ZT7G7vtc1mZ8NGZBVrGSPqc1WEfbRYF
         E9iGOHZbiZ32ORabIqVKSrhYhYpiE4X3jhwmR0p6znorlKU6kkCkwNKYCvUxjy0iN+L7
         4h1WEjVBcQMNywk1bpROn6FPLXm/yrNGtpoz3zC5mdtn0pX/terhok2DPMSIBILbvs62
         42u207erXiwxnoGSDvZNg3ow7nHdqX7VFI3atWG/bXm+UkOlIZUQblSBRREasuSJ/Blk
         gnWUQm4mD15xZrIv3+0ULhNGDWTuiFem53hsKddoWN1op8EDvDEr3MOnkIICMnlryCKV
         i8Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUupSRN8AiH8qs930vhrghseTwOkW6O8Ub+9N78imiSw4i2q+YCQ1FUZOqulsAf6EyaKdk0cxHmfdpNKw2I@vger.kernel.org, AJvYcCV7TpEdSOnNgt7wQ2lIj6VPxNU50sAA8bnTJ6AO2821v5GNVtIKfs/4vHPq0ZgVQJphWXmXBXEYlkvdRkE=@vger.kernel.org, AJvYcCWop2R9Qjdl73oQ0nTlHEgGMR7JIODOe0LdPyGyjI1l+sNPk5caF8z4lYogXZH9BIIvk1OO2vmN98mg@vger.kernel.org, AJvYcCXSI0QCttMHnmppIeBhxbqZg/IN8AMXKKoFkpHLGr3GNZQRBGsLwdQ4SwzJ801HLhi8CoJZmFlhpVmC@vger.kernel.org, AJvYcCXVU1r2oOJAntzrRP4lkSfAVVdCTvL1Mz7TKa+Xa2kJx0GHvsz7TIn7p3DSzQJhpRO//ZaYNHf8roiEy7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYW7sZlHu1RLQm+0wbSWoY6XPNbonRJi20537SCd/1J0Zp4Xex
	1zFtqg8BtABJ3NCKPjlwR7JlKbaPwIitqSX1XotYgtDw2+M6XH+ds75e
X-Gm-Gg: ASbGncvP8vX4JfgdfjMLo/iFHOt/OQ+yGhjXZM6akp0JDSyLy9tPuFrurwysjcsW3q0
	X8ug3Vdph4nn05+poZNMFdjPh6tFrEvGP3mpUC/dly+ioMv/0m96qkNxOwg0ZZ+X/nG9O7kfa+C
	UsESPT2am3mQS6CMwgHJVMSbUAX3lCH+e0k4Xt8eE2GDdM0vl/6Nvur2fuJkw0Z6YsLI8A6aAik
	02LqsWmzNjkpNlV9KjIXcpwkZY57F0ju3JBtrhH4M8GbTeZ4CU1Wele1SGLqOY7aCpB8tJwkh7a
	IN3hVXbAV1SdiczRYIUAc1XQQ3KevPEdiUbkOq1tnedeg9NRkknz5zedUhVnO4W4ot1MpMfllfD
	qqTrjFOKG2+WICYYJLWkiv1XGLWWp5WRAGe0HQOfuW0KMF2ngiq7yXEw4ocPUrb2u1COd3tyxrd
	7Ayb/NyUqFVn3L+pYbZ4szl94iTNxta4yoQlUn
X-Google-Smtp-Source: AGHT+IHTftf4N5GtR12Y+/exYwqwrBeyGH7smZ0yJma1RxTQV8AhvHtCqyA7wcE9I8tc1xaJxOtv7w==
X-Received: by 2002:a05:6a20:3943:b0:23d:ac50:333e with SMTP id adf61e73a8af0-2430d4d57b3mr3359435637.43.1755604087256;
        Tue, 19 Aug 2025 04:48:07 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d76a430sm10286316a12.43.2025.08.19.04.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:48:06 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH 0/8] mfd: macsmc: add rtc, hwmon and hid subdevices
Date: Tue, 19 Aug 2025 21:47:52 +1000
Message-Id: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGhkpGgC/x3MPQqAMAxA4atIZgtpRSteRRw0jZrBHxoUQXp3i
 +M3vPeCchRW6IoXIt+icuwZtiyA1nFf2EjIBoeuxtY2ZhtJNzJ6TYFvNa3HyhFaH5AgR2fkWZ5
 /2A8pfUSAoVdgAAAA
X-Change-ID: 20250816-macsmc-subdevs-87032c017d0c
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>, 
 Mark Kettenis <kettenis@openbsd.org>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4439;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=7ZN9mquuvmQGhl/5cAieHoqLnblhiM9pvWAqAoyRNDU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlLUvIqW5TYMuxC+++cFnu1f/ZGP9Mf0p8qr9deu7V4e
 rnMe6abHaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAEwkRpaR4UURzySBlincJoWh
 R9jTOSdsW5V8vn/eA7aJYZ0PeO6ohTAy/Pxw89OhxYoaU2boSRx6daOlcFV1cd+FzxpbulfdsZJ
 /zAMA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi all,

This series adds support for the remaining SMC subdevices. These are the
RTC, hwmon, and HID devices. They are being submitted together as the RTC
and hwmon drivers both require changes to the SMC DT schema.

The RTC driver is responsible for getting and setting the system clock,
and requires an NVMEM cell. This series replaces Sven's original RTC driver
submission [1].

The hwmon function is an interesting one. While each Apple Silicon device
exposes pretty similar sets of sensors, these all seem to be paired to
different SMC keys in the firmware interface. This is true even when the
sensors are on the SoC. For example, an M1 MacBook Pro will use different
keys to access the LITTLE core temperature sensors to an M1 Mac mini. This
necessitates describing which keys correspond to which sensors for each
device individually, and populating the hwmon structs at runtime. We do
this with a node in the device tree. This series includes only the keys
for sensors which we know to be common to all devices. The SMC is also
responsible for monitoring and controlling fan speeds on systems with fans,
which we expose via the hwmon driver.

The SMC also handles the hardware power button and lid switch. Power
button presses and lid opening/closing are emitted as HID events, so we
add a HID subdevice to handle them.

Note that this series is based on a branch with three additional commits
applied to add the parent SMC nodes to the relevant Devicetrees. This
was done to silence build errors. The series applies cleanly to 6.17-rc1.

Regards,

James

[1] https://lore.kernel.org/asahi/CAEg-Je84XxLWH7vznQmPRfjf6GxWOu75ZetwN7AdseAwfMLLrQ@mail.gmail.com/T/#t

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
Hector Martin (2):
      rtc: Add new rtc-macsmc driver for Apple Silicon Macs
      input: macsmc-hid: New driver to handle the Apple Mac SMC buttons/lid

James Calligeros (4):
      dt-bindings: hwmon: add Apple System Management Controller hwmon schema
      hwmon: Add Apple Silicon SMC hwmon driver
      arm64: dts: apple: add common hwmon sensors and fans
      arm64: dts: apple: t8103, t600x, t8112: add common hwmon nodes to devices

Sven Peter (2):
      dt-bindings: rtc: Add Apple SMC RTC
      arm64: dts: apple: t8103,t600x,t8112: Add SMC RTC node

 .../bindings/hwmon/apple,smc-hwmon.yaml  | 148 +++++
 .../bindings/mfd/apple,smc.yaml          |  54 ++
 .../bindings/rtc/apple,smc-rtc.yaml      |  35 +
 MAINTAINERS                              |   5 +
 .../boot/dts/apple/hwmon-common.dtsi     |  46 ++
 .../boot/dts/apple/hwmon-fan-dual.dtsi   |  27 +
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi |  21 +
 .../boot/dts/apple/hwmon-laptop.dtsi     |  43 ++
 .../boot/dts/apple/hwmon-mac-mini.dtsi   |  19 +
 .../arm64/boot/dts/apple/t6001-j375c.dts |   2 +
 .../arm64/boot/dts/apple/t6002-j375d.dts |   2 +
 .../arm64/boot/dts/apple/t600x-die0.dtsi |   6 +
 .../boot/dts/apple/t600x-j314-j316.dtsi  |   4 +
 .../arm64/boot/dts/apple/t600x-j375.dtsi |   2 +
 arch/arm64/boot/dts/apple/t8103-j274.dts |   2 +
 arch/arm64/boot/dts/apple/t8103-j293.dts |   3 +
 arch/arm64/boot/dts/apple/t8103-j313.dts |   2 +
 arch/arm64/boot/dts/apple/t8103-j456.dts |   2 +
 arch/arm64/boot/dts/apple/t8103-j457.dts |   2 +
 .../arm64/boot/dts/apple/t8103-jxxx.dtsi |   2 +
 arch/arm64/boot/dts/apple/t8103.dtsi     |   6 +
 arch/arm64/boot/dts/apple/t8112-j413.dts |   2 +
 arch/arm64/boot/dts/apple/t8112-j473.dts |   2 +
 arch/arm64/boot/dts/apple/t8112-j493.dts |   3 +
 .../arm64/boot/dts/apple/t8112-jxxx.dtsi |   2 +
 arch/arm64/boot/dts/apple/t8112.dtsi     |   6 +
 drivers/hwmon/Kconfig                    |  12 +
 drivers/hwmon/Makefile                   |   1 +
 drivers/hwmon/macsmc_hwmon.c             | 858 +++++++++++++++++++++++++
 drivers/input/misc/Kconfig               |  11 +
 drivers/input/misc/Makefile              |   1 +
 drivers/input/misc/macsmc-hid.c          | 210 ++++++
 drivers/mfd/macsmc.c                     |   3 +
 drivers/rtc/Kconfig                      |  11 +
 drivers/rtc/Makefile                     |   1 +
 drivers/rtc/rtc-macsmc.c                 | 141 ++++
 36 files changed, 1697 insertions(+)
---
base-commit: 876d6a70b24869f96ebc8672caf86cb4bae72927
change-id: 20250816-macsmc-subdevs-87032c017d0c

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>



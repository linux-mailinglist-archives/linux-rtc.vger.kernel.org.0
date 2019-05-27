Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E8592B45B
	for <lists+linux-rtc@lfdr.de>; Mon, 27 May 2019 14:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbfE0MGa (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 May 2019 08:06:30 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:36047 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbfE0MGa (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 May 2019 08:06:30 -0400
X-Originating-IP: 90.66.53.80
Received: from localhost (lfbn-1-3034-80.w90-66.abo.wanadoo.fr [90.66.53.80])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 76E9CFF819;
        Mon, 27 May 2019 12:06:26 +0000 (UTC)
Date:   Mon, 27 May 2019 14:06:26 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: rtc: Move trivial RTC over to trivial
 devices
Message-ID: <20190527120626.GM3274@piout.net>
References: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 27/05/2019 14:00:33+0200, Maxime Ripard wrote:
> The RTC generic bindings has a bunch of devices that have a pretty simple
> binding, with just compatible, reg and optional interrupts properties.
> 

This is not true, they all also support the star-year property, this is
why they are not in the trivial-devices file anymore.

> This is exactly what the trivial devices YAML schema has been created for,
> so let's move those devices there.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/rtc/rtc.txt          | 39 +--------
>  Documentation/devicetree/bindings/trivial-devices.yaml | 54 +++++++++++-
>  2 files changed, 54 insertions(+), 39 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc.txt b/Documentation/devicetree/bindings/rtc/rtc.txt
> index a97fc6a9a75e..234bd2af1830 100644
> --- a/Documentation/devicetree/bindings/rtc/rtc.txt
> +++ b/Documentation/devicetree/bindings/rtc/rtc.txt
> @@ -31,42 +31,3 @@ below.
>                              expressed in femto Farad (fF).
>                              The default value shall be listed (if optional),
>                              and likewise all valid values.
> -
> -Trivial RTCs
> -------------
> -
> -This is a list of trivial RTC devices that have simple device tree
> -bindings, consisting only of a compatible field, an address and
> -possibly an interrupt line.
> -
> -
> -Compatible		Vendor / Chip
> -==========		=============
> -abracon,abb5zes3	AB-RTCMC-32.768kHz-B5ZE-S3: Real Time Clock/Calendar Module with I2C Interface
> -abracon,abeoz9		AB-RTCMC-32.768kHz-EOZ9: Real Time Clock/Calendar Module with I2C Interface
> -dallas,ds1374		I2C, 32-Bit Binary Counter Watchdog RTC with Trickle Charger and Reset Input/Output
> -dallas,ds1672		Dallas DS1672 Real-time Clock
> -dallas,ds3232		Extremely Accurate I²C RTC with Integrated Crystal and SRAM
> -epson,rx8010		I2C-BUS INTERFACE REAL TIME CLOCK MODULE
> -epson,rx8571		I2C-BUS INTERFACE REAL TIME CLOCK MODULE with Battery Backed RAM
> -epson,rx8581		I2C-BUS INTERFACE REAL TIME CLOCK MODULE
> -emmicro,em3027		EM Microelectronic EM3027 Real-time Clock
> -isil,isl1208		Intersil ISL1208 Low Power RTC with Battery Backed SRAM
> -isil,isl1218		Intersil ISL1218 Low Power RTC with Battery Backed SRAM
> -isil,isl12022		Intersil ISL12022 Real-time Clock
> -microcrystal,rv3028	Real Time Clock Module with I2C-Bus
> -microcrystal,rv3029	Real Time Clock Module with I2C-Bus
> -microcrystal,rv8523	Real Time Clock
> -nxp,pcf2127		Real-time clock
> -nxp,pcf2129		Real-time clock
> -nxp,pcf8563		Real-time clock/calendar
> -pericom,pt7c4338	Real-time Clock Module
> -ricoh,r2025sd		I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
> -ricoh,r2221tl		I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
> -ricoh,rs5c372a		I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
> -ricoh,rs5c372b		I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
> -ricoh,rv5c386		I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
> -ricoh,rv5c387a		I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
> -sii,s35390a		2-wire CMOS real-time clock
> -whwave,sd3078		I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
> -xircom,x1205		Xircom X1205 I2C RTC
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 747fd3f689dc..96035c5970d8 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -26,6 +26,10 @@ properties:
>    compatible:
>      items:
>        - enum:
> +            # AB-RTCMC-32.768kHz-B5ZE-S3: Real Time Clock/Calendar Module with I2C Interface
> +          - abracon,abb5zes3
> +            # AB-RTCMC-32.768kHz-EOZ9: Real Time Clock/Calendar Module with I2C Interface
> +          - abracon,abeoz9
>              # SMBus/I2C Digital Temperature Sensor in 6-Pin SOT with SMBus Alert and Over Temperature Pin
>            - ad,ad7414
>              # ADM9240:  Complete System Hardware Monitor for uProcessor-Based Systems
> @@ -56,12 +60,18 @@ properties:
>            - capella,cm32181
>              # CM3232: Ambient Light Sensor
>            - capella,cm3232
> +            # I2C, 32-Bit Binary Counter Watchdog RTC with Trickle Charger and Reset Input/Output
> +          - dallas,ds1374
>              # High-Precision Digital Thermometer
>            - dallas,ds1631
> +            # Dallas DS1672 Real-time Clock
> +          - dallas,ds1672
>              # Total-Elapsed-Time Recorder with Alarm
>            - dallas,ds1682
>              # Tiny Digital Thermometer and Thermostat
>            - dallas,ds1775
> +            # Extremely Accurate I²C RTC with Integrated Crystal and SRAM
> +          - dallas,ds3232
>              # CPU Supervisor with Nonvolatile Memory and Programmable I/O
>            - dallas,ds4510
>              # Digital Thermometer and Thermostat
> @@ -80,6 +90,12 @@ properties:
>            - domintech,dmard09
>              # DMARD10: 3-axis Accelerometer
>            - domintech,dmard10
> +            # I2C-BUS INTERFACE REAL TIME CLOCK MODULE
> +          - epson,rx8010
> +            # I2C-BUS INTERFACE REAL TIME CLOCK MODULE with Battery Backed RAM
> +          - epson,rx8571
> +            # I2C-BUS INTERFACE REAL TIME CLOCK MODULE
> +          - epson,rx8581
>              # MMA7660FC: 3-Axis Orientation/Motion Detection Sensor
>            - fsl,mma7660
>              # MMA8450Q: Xtrinsic Low-power, 3-axis Xtrinsic Accelerometer
> @@ -100,6 +116,12 @@ properties:
>            - infineon,slb9645tt
>              # Infineon TLV493D-A1B6 I2C 3D Magnetic Sensor
>            - infineon,tlv493d-a1b6
> +            # Intersil ISL1208 Low Power RTC with Battery Backed SRAM
> +          - isil,isl1208
> +            # Intersil ISL1218 Low Power RTC with Battery Backed SRAM
> +          - isil,isl1218
> +            # Intersil ISL12022 Real-time Clock
> +          - isil,isl12022
>              # Intersil ISL29028 Ambient Light and Proximity Sensor
>            - isil,isl29028
>              # Intersil ISL29030 Ambient Light and Proximity Sensor
> @@ -274,6 +296,12 @@ properties:
>            - microchip,tc654
>              # PWM Fan Speed Controller With Fan Fault Detection
>            - microchip,tc655
> +            # Real Time Clock Module with I2C-Bus
> +          - microcrystal,rv3028
> +            # Real Time Clock Module with I2C-Bus
> +          - microcrystal,rv3029
> +            # Real Time Clock
> +          - microcrystal,rv8523
>              # MiraMEMS DA226 2-axis 14-bit digital accelerometer
>            - miramems,da226
>              # MiraMEMS DA280 3-axis 14-bit digital accelerometer
> @@ -300,18 +328,40 @@ properties:
>            - nxp,pca9556
>              # 8-bit I2C-bus and SMBus I/O port with reset
>            - nxp,pca9557
> +            # Real-time clock
> +          - nxp,pcf2127
> +            # Real-time clock
> +          - nxp,pcf2129
> +            # Real-time clock/calendar
> +          - nxp,pcf8563
>              # OKI ML86V7667 video decoder
>            - oki,ml86v7667
>              # OV5642: Color CMOS QSXGA (5-megapixel) Image Sensor with OmniBSI and Embedded TrueFocus
>            - ovti,ov5642
> +            # Real-time Clock Module
> +          - pericom,pt7c4338
>              # 48-Lane, 12-Port PCI Express Gen 2 (5.0 GT/s) Switch
>            - plx,pex8648
>              # Pulsedlight LIDAR range-finding sensor
>            - pulsedlight,lidar-lite-v2
> +            # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
> +          - ricoh,r2025sd
> +            # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
> +          - ricoh,r2221tl
> +            # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
> +          - ricoh,rs5c372a
> +            # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
> +          - ricoh,rs5c372b
> +            # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
> +          - ricoh,rv5c386
> +            # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
> +          - ricoh,rv5c387a
>              # S524AD0XF1 (128K/256K-bit Serial EEPROM for Low Power)
>            - samsung,24ad0xd1
>              # SGX Sensortech VZ89X Sensors
>            - sgx,vz89x
> +            # 2-wire CMOS real-time clock
> +          - sii,s35390a
>              # Relative Humidity and Temperature Sensors
>            - silabs,si7020
>              # Skyworks SKY81452: Six-Channel White LED Driver with Touch Panel Bias Supply
> @@ -336,10 +386,14 @@ properties:
>            - ti,tmp103
>              # Digital Temperature Sensor
>            - ti,tmp275
> +            # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
> +          - whwave,sd3078
>              # Winbond/Nuvoton H/W Monitor
>            - winbond,w83793
>              # i2c trusted platform module (TPM)
>            - winbond,wpct301
> +            # Xircom X1205 I2C RTC
> +          - xircom,x1205
>  
>  required:
>    - compatible
> 
> base-commit: 89d8c504132e4c247707ac92d4bf6bb6607461dd
> -- 
> git-series 0.9.1

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
